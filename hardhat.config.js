require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-etherscan")
require("hardhat-deploy")
require("hardhat-gas-reporter")
require("hardhat-contract-sizer")
require("solidity-coverage")
require("dotenv").config()

const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL || ""
const GOERLI_PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY || ""
const GOERLI_RPC_URL = process.env.GOERLI_RPC_URL || ""
const GNOSIS_PRIVATE_KEY = process.env.GOERLI_PRIVATE_KEY || ""
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY || ""
const COINMARKETCAP_API_KEY = process.env.COINMARKETCAP_API_KEY || ""

module.exports = {
    defaultNetwork: "hardhat",
    networks: {
        hardhat: {
            chainId: 31337,
            blockConfirmations: 1,
        },
        goerli: {
            chainId: 5,
            blockConfirmations: 6,
            url: GOERLI_RPC_URL,
            accounts: [GOERLI_PRIVATE_KEY],
        },
        gnosis : {
            chainId: 100,
            blockConfirmations: 10,
            url: GNOSIS_RPC_URL,
            accounts: [GNOSIS_PRIVATE_KEY],
        },
    },
    solidity: "0.8.17",
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
