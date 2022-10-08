// SPDX-License-Identifier: 0BSD
pragma solidity ^0.8.17;

import {ISuperfluid, ISuperToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import {IConstantFlowAgreementV1} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";

import {ICoWSwapSettlement} from "./interfaces/ICoWSwapSettlement.sol";
import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";
import {IERC1271} from "@openzeppelin/contracts/interfaces/IERC1271.sol";
import {CFAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/CFAv1Library.sol";

contract SmartCoWOrder is IERC1271 {
    bytes4 constant ERC1271_MAGIC_VALUE = 0x1626ba7e;

    address public immutable owner;
    uint256 public dcaAmount;
    bytes32 public orderHash;
    IERC20 public immutable sellToken;
    ISuperToken public immutable superToken;
    using CFAv1Library for CFAv1Library.InitData;
    CFAv1Library.InitData public cfaV1;

    event Downgraded(uint256 amount);

    constructor(
        address owner_,
        ISuperfluid host,
        IERC20 sellToken_,
        ISuperToken superToken_,
        uint256 dcaAmount_,
        bytes32 orderHash_,
        ICoWSwapSettlement settlement
    ) {
        owner = owner_;
        sellToken = sellToken_;
        superToken = superToken_;
        dcaAmount = dcaAmount_;
        orderHash = orderHash_;

        sellToken_.approve(settlement.vaultRelayer(), type(uint256).max);
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

    function updateAmount(uint256 newDcaAmount) external {
        require(msg.sender == owner, "not the owner");
        dcaAmount = newDcaAmount;
    }

    function downgrade() external {
        uint256 balance = superToken.balanceOf(address(this));
        require(balance >= dcaAmount, "small balance");
        superToken.downgrade(dcaAmount);
        emit Downgraded(dcaAmount);
    }

    function isValidSignature(bytes32 orderHash_, bytes calldata)
        external
        view
        returns (bytes4 magicValue)
    {
        require(orderHash_ == orderHash, "invalid order");
        require(sellToken.balanceOf(address(this)) >= dcaAmount, "low balance");
        magicValue = ERC1271_MAGIC_VALUE;
    }

    function cancel() public {
        require(msg.sender == owner, "not the owner");
        orderHash = bytes32(0);
        cfaV1.deleteFlow(owner, address(this), superToken);
        sellToken.transfer(owner, sellToken.balanceOf(address(this)));
        superToken.transfer(owner, superToken.balanceOf(address(this)));
    }
}
