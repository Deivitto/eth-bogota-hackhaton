// SPDX-License-Identifier: 0BSD
pragma solidity ^0.8.17;

import {ISuperfluid, ISuperToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import {IConstantFlowAgreementV1} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";

import {ICoWSwapSettlement} from "./interfaces/ICoWSwapSettlement.sol";
import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";
import {IERC1271} from "@openzeppelin/contracts/interfaces/IERC1271.sol";
import {CFAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/CFAv1Library.sol";
import {GPv2Order} from "./vendored/GPv2Order.sol";
import {ICoWSwapOnchainOrders} from "./vendored/ICoWSwapOnchainOrders.sol";
import {AutomationCompatibleInterface} from "@chainlink/contracts/src/v0.8/interfaces/AutomationCompatibleInterface.sol";

contract SmartCoWOrder is IERC1271, ICoWSwapOnchainOrders, AutomationCompatibleInterface {
    using GPv2Order for *;
    using CFAv1Library for CFAv1Library.InitData;

    bytes4 constant ERC1271_MAGIC_VALUE = 0x1626ba7e;
    bytes32 public constant APP_DATA = keccak256("Smart DCA");

    address public immutable owner;
    bytes32 public orderHash;
    bytes32 public immutable domainSeparator;
    ISuperToken public immutable superToken;

    CFAv1Library.InitData public cfaV1;
    Data public data;

    bool isOpen = true;

    struct Data {
        IERC20 sellToken;
        IERC20 buyToken;
        address receiver;
        uint256 sellAmount;
        uint256 buyAmount;
        uint32 deadline;
        uint256 feeAmount;
        bytes meta;
    }

    event Downgraded(uint256 amount);
    event OrderUID(bytes orderUID);

    constructor(
        address owner_,
        ISuperfluid host,
        ISuperToken superToken_,
        ICoWSwapSettlement settlement,
        Data memory data_
    ) {
        owner = owner_;
        superToken = superToken_;
        data = data_;
        domainSeparator = settlement.domainSeparator();
        IERC20(data.sellToken).approve(settlement.vaultRelayer(), type(uint256).max);
        cfaV1 = CFAv1Library.InitData(
            host,
            IConstantFlowAgreementV1(
                address(
                    host.getAgreementClass(
                        keccak256("org.superfluid-finance.agreements.ConstantFlowAgreement.v1")
                    )
                )
            )
        );
    }

    function updateData(Data memory data_) external {
        require(msg.sender == owner, "not the owner");
        require(
            data.sellToken == data_.sellToken && data.buyToken == data_.buyToken,
            "Cant change tokens"
        );
        data = data_;
    }

    function performUpkeep(
        bytes calldata /* performData */
    ) external override {
        require(
            isOpen && (superToken.balanceOf(address(this)) >= data.sellAmount),
            "upKeep not needed"
        );
        superToken.downgrade(data.sellAmount);
        emit Downgraded(data.sellAmount);

        GPv2Order.Data memory order = GPv2Order.Data({
            sellToken: data.sellToken,
            buyToken: data.buyToken,
            receiver: data.receiver == GPv2Order.RECEIVER_SAME_AS_OWNER ? owner : data.receiver,
            sellAmount: data.sellAmount,
            buyAmount: data.buyAmount,
            validTo: uint32(block.timestamp) + data.deadline,
            appData: APP_DATA,
            feeAmount: data.feeAmount,
            kind: GPv2Order.KIND_SELL,
            partiallyFillable: false,
            sellTokenBalance: GPv2Order.BALANCE_ERC20,
            buyTokenBalance: GPv2Order.BALANCE_ERC20
        });
        orderHash = order.hash(domainSeparator);
        OnchainSignature memory signature = OnchainSignature({
            scheme: OnchainSigningScheme.Eip1271,
            data: hex""
        });

        emit OrderPlacement(address(this), order, signature, data.meta);

        bytes memory orderUid = new bytes(GPv2Order.UID_LENGTH);
        orderUid.packOrderUidParams(orderHash, address(this), order.validTo);
        emit OrderUID(orderUid);
    }

    function checkUpkeep(
        bytes calldata /* checkData */
    ) public view override returns (bool upkeepNeeded, bytes memory performData) {
        upkeepNeeded = isOpen && superToken.balanceOf(address(this)) >= data.sellAmount;
        performData = "";
    }

    function isValidSignature(bytes32 orderHash_, bytes calldata)
        external
        view
        returns (bytes4 magicValue)
    {
        require(orderHash_ == orderHash, "invalid order");
        require(IERC20(data.sellToken).balanceOf(address(this)) >= data.sellAmount, "low balance");
        magicValue = ERC1271_MAGIC_VALUE;
    }

    function cancel() public {
        require(msg.sender == owner, "not the owner");
        require(isOpen, "Already closed");
        orderHash = bytes32(0);
        cfaV1.deleteFlow(owner, address(this), superToken);
        IERC20 sellToken = IERC20(data.sellToken);
        sellToken.transfer(owner, sellToken.balanceOf(address(this)));
        superToken.transfer(owner, superToken.balanceOf(address(this)));
        isOpen = false;
    }
}
