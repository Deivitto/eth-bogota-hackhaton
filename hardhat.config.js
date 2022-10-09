require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-etherscan")
require("hardhat-deploy")
require("hardhat-gas-reporter")
require("hardhat-contract-sizer")
require("solidity-coverage")
require("dotenv").config()

const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL || ""
const POLYGON_RPC_URL = process.env.POLYGON_RPC_URL || ""
const PRIVATE_KEY = process.env.PRIVATE_KEY || ""
const GNOSIS_RPC_URL = process.env.GNOSIS_RPC_URL || ""
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || ""
const COINMARKETCAP_API_KEY = process.env.COINMARKETCAP_API_KEY || ""

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {},
        goerli: {
            chainId: 5,
            blockConfirmations: 1,
            url: GOERLI_RPC_URL,
            accounts: [PRIVATE_KEY],
        },
        gnosis: {
            chainId: 100,
            blockConfirmations: 10,
            url: GNOSIS_RPC_URL,
            accounts: [PRIVATE_KEY],
        },
        polygon: {
            chainId: 137,
            blockConfirmations: 3,
            url: POLYGON_RPC_URL,
            accounts: [PRIVATE_KEY],
        },
    },
    solidity: {
        version: "0.8.17",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200,
            },
        },
    },
    namedAccounts: {
        deployer: {
            default: 0,
        },
        player: {
            default: 1,
        },
    },
    gasReporter: {
        enabled: false,
        outputFile: "gas-report.txt",
        noColors: true,
        currency: "USD",
        coinmarketcap: COINMARKETCAP_API_KEY,
        token: "ETH",
    },
    etherscan: {
        apiKey: ETHERSCAN_API_KEY,
    },
    mocha: {
        timeout: 200000,
    },
}
