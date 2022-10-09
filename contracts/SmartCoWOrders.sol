// SPDX-License-Identifier: 0BSD
pragma solidity ^0.8.17;
pragma experimental ABIEncoderV2;

import {ISuperfluid, ISuperToken, ISuperApp, ISuperAgreement, ContextDefinitions, SuperAppDefinitions} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import {ISuperfluidToken} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluidToken.sol";
import {IConstantFlowAgreementV1} from "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";
import {SuperAppBase} from "@superfluid-finance/ethereum-contracts/contracts/apps/SuperAppBase.sol";
import {CFAv1Library} from "@superfluid-finance/ethereum-contracts/contracts/apps/CFAv1Library.sol";

import {ICoWSwapSettlement} from "./interfaces/ICoWSwapSettlement.sol";
import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";
import {GPv2Order} from "./vendored/GPv2Order.sol";
import {SmartCoWOrder} from "./SmartCoWOrder.sol";

contract SmartCoWOrders is SuperAppBase {
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
        uint256 configWord = SuperAppDefinitions.APP_LEVEL_FINAL |
            SuperAppDefinitions.BEFORE_AGREEMENT_CREATED_NOOP |
            SuperAppDefinitions.BEFORE_AGREEMENT_UPDATED_NOOP |
            SuperAppDefinitions.BEFORE_AGREEMENT_TERMINATED_NOOP;
        // can be an empty string in dev or testnet deployments

        host.registerApp(configWord);
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

    //     /**************************************************************************
    //      * SuperApp callbacks
    //      *************************************************************************/

    //     function afterAgreementCreated(
    //         ISuperToken _superToken,
    //         address _agreementClass,
    //         bytes32, // _agreementId,
    //         bytes calldata _agreementData, /*_agreementData*/
    //         bytes calldata, // _cbdata,
    //         bytes calldata _ctx
    //     ) external override returns (bytes memory newCtx) {}

    //     function beforeAgreementUpdated(
    //         ISuperToken _superToken,
    //         address _agreementClass,
    //         bytes32, /*agreementId*/
    //         bytes calldata _agreementData, /*agreementData*/
    //         bytes calldata /*ctx*/
    //     ) external view virtual override returns (bytes memory cbdata) {}

    //     function afterAgreementUpdated(
    //         ISuperToken _superToken,
    //         address _agreementClass,
    //         bytes32, //_agreementId,
    //         bytes calldata _agreementData, //agreementData,
    //         bytes calldata _cbdata,
    //         bytes calldata _ctx
    //     ) external override returns (bytes memory newCtx) {}

    //     function beforeAgreementTerminated(
    //         ISuperToken, /*superToken*/
    //         address, /*agreementClass*/
    //         bytes32, /*agreementId*/
    //         bytes calldata _agreementData, /*agreementData*/
    //         bytes calldata /*ctx*/
    //     ) external view virtual override returns (bytes memory cbdata) {}

    //     function afterAgreementTerminated(
    //         ISuperToken _superToken,
    //         address _agreementClass,
    //         bytes32, //_agreementId,
    //         bytes calldata _agreementData, /*_agreementData*/
    //         bytes calldata _cbdata,
    //         bytes calldata _ctx
    //     ) external override returns (bytes memory newCtx) {}
    // }
}
