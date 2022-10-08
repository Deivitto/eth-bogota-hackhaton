// SPDX-License-Identifier: 0BSD
pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;

import {ISuperfluid, ISuperToken, ISuperApp, ISuperAgreement, ContextDefinitions, SuperAppDefinitions} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import {ISuperfluidToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluidToken.sol";
import {IConstantFlowAgreementV1} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";
import {SuperAppBase} from "@superfluid-finance/ethereum-contracts/contracts/apps/SuperAppBase.sol";
import {CFAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/CFAv1Library.sol";
import {IDAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/IDAv1Library.sol";

import {ICoWSwapSettlement} from "./interfaces/ICoWSwapSettlement.sol";
import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";
import {GPv2Order} from "./vendored/GPv2Order.sol";
import {SmartCoWOrder} from "./SmartCoWOrder.sol";
import {ICoWSwapOnchainOrders} from "./vendored/ICoWSwapOnchainOrders.sol";

// Create DCA order
// Order: owner, DCA amount, min frequency
//

contract SmartCoWOrder2 is ICoWSwapOnchainOrders {
    using GPv2Order for *;
    ISuperfluid host;
    using CFAv1Library for CFAv1Library.InitData;
    CFAv1Library.InitData public cfaV1;

    struct Data {
        IERC20 sellToken;
        IERC20 buyToken;
        address receiver;
        uint256 sellAmount;
        uint256 buyAmount;
        uint32 validFrom;
        uint32 validTo;
        uint256 feeAmount;
        bytes meta;
    }

    bytes32 public constant APP_DATA = keccak256("Smart DCA");

    ICoWSwapSettlement public immutable settlement;
    bytes32 public immutable domainSeparator;

    mapping(address => address) public addressToContract;

    constructor(ISuperfluid host_, ICoWSwapSettlement settlement_) {
        settlement = settlement_;
        host = host_;
        domainSeparator = settlement_.domainSeparator();
        // Initialize CFA Library
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

    function place(
        Data calldata data,
        ISuperToken superToken,
        int96 flowRate,
        bytes32 salt
    ) external returns (bytes memory orderUid) {
        require(superToken.getUnderlyingToken() == address(data.sellToken), "!SuperToken");
        GPv2Order.Data memory order = GPv2Order.Data({
            sellToken: data.sellToken,
            buyToken: data.buyToken,
            receiver: data.receiver == GPv2Order.RECEIVER_SAME_AS_OWNER
                ? msg.sender
                : data.receiver,
            sellAmount: data.sellAmount,
            buyAmount: data.buyAmount,
            validTo: data.validTo,
            appData: APP_DATA,
            feeAmount: data.feeAmount,
            kind: GPv2Order.KIND_SELL,
            partiallyFillable: false,
            sellTokenBalance: GPv2Order.BALANCE_ERC20,
            buyTokenBalance: GPv2Order.BALANCE_ERC20
        });
        bytes32 orderHash = order.hash(domainSeparator);

        SmartCoWOrder instance = new SmartCoWOrder{salt: salt}(
            msg.sender,
            host,
            data.sellToken,
            superToken,
            data.sellAmount,
            orderHash,
            settlement
        );

        /** @dev: Require this contract to be a flowOperator for msg.sender */
        cfaV1.createFlowByOperator(msg.sender, address(instance), superToken, flowRate);

        OnchainSignature memory signature = OnchainSignature({
            scheme: OnchainSigningScheme.Eip1271,
            data: hex""
        });

        emit OrderPlacement(address(instance), order, signature, data.meta);

        orderUid = new bytes(GPv2Order.UID_LENGTH);
        orderUid.packOrderUidParams(orderHash, address(instance), data.validTo);

        addressToContract[msg.sender] = address(instance);
    }
}
