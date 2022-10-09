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

contract SmartCoWOrders {
    using GPv2Order for *;
    using CFAv1Library for CFAv1Library.InitData;
    CFAv1Library.InitData public cfaV1;
    ISuperfluid host;
    ICoWSwapSettlement public immutable settlement;

    mapping(address => address) public addressToContract;

    constructor(ISuperfluid host_, ICoWSwapSettlement settlement_) {
        settlement = settlement_;
        host = host_;
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
        SmartCoWOrder.Data calldata data,
        ISuperToken superToken,
        int96 flowRate
    ) external {
        require(superToken.getUnderlyingToken() == address(data.sellToken), "!SuperToken");
        SmartCoWOrder instance = new SmartCoWOrder(msg.sender, host, superToken, settlement, data);

        /** @dev: Require this contract to be a flowOperator for msg.sender */
        cfaV1.createFlowByOperator(msg.sender, address(instance), superToken, flowRate);
        addressToContract[msg.sender] = address(instance);
    }
}
