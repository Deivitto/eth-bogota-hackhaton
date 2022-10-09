import { ethers } from "ethers"
import { defaultEvmStores } from "svelte-ethers-store"
// import CoinbaseWalletSDK from "@coinbase/wallet-sdk"
// import CoinbaseWalletSDK from "@coinbase/wallet-sdk"
// import WalletConnect from "@walletconnect/web3-provider"

import abi from "./abi/ourContract.json"

// Web3modal instance
let web3Modal

// Chosen wallet provider given by the dialog window
let provider
const contractName = "ourContractName"
const contractAddress = "0xCEfa58184aa1C45Baa98B02687451B412F2Acaa6"

/**
 * Setup the orchestra
 */

import Web3Modal from "web3modal"

export const connectWallet = async () => {
    const WalletConnectProvider = window.WalletConnectProvider.default
    const CoinbaseWalletProvider = window.CoinbaseWalletProvider.prototype
    console.log(window)
    const providerOptions = {
        coinbasewallet: {
            package: CoinbaseWalletProvider,
            options: {
                appName: "Web 3 Modal Demo",
                // infuraId: process.env.INFURA_KEY,
            },
        },
        walletconnect: {
            package: WalletConnectProvider,
            options: {
                // Mikko's test key - don't copy as your mileage may vary
                rpc: {
                    80001: "https://matic-mumbai--jsonrpc.datahub.figment.io/apikey/f1f9f2031af0fbbd9d45fb6c87caf3c2",
                },
            },
        },
    }

    web3Modal = new Web3Modal({
        providerOptions, // required
    })
    try {
        const provider = await web3Modal.connect()
        const library = new ethers.providers.Web3Provider(provider)
        // setProvider(provider);
        // setLibrary(library);
    } catch (error) {
        console.error(error)
    }
}

export async function init() {
    console.log("init start", window)
    try {
        if (window != null) {
            if (window.WalletConnectProvider != null && window.CoinbaseWalletProvider != null) {
                console.log("There is a window")
                console.log("WalletConnect", window.WalletConnectProvider)
                const WalletConnectProvider = window.WalletConnectProvider.default
                console.log("CoinbaseWalletProvider", window.CoinbaseWalletProvider)
                const CoinbaseWalletProvider = window.CoinbaseWalletProvider.prototype
                console.log("Providers ")

                // console.log(CoinbaseWalletSDK)
                console.log(window.CoinbaseWalletSDK)
                console.log("Initializing example")
                console.log("WalletConnectProvider is", WalletConnectProvider)
                console.log("window.web3 is", ethers, "window.ethereum is", window.ethereum)

                // Check that the web page is run in a secure context,
                // as otherwise MetaMask won't be available

                // Tell Web3modal what providers we have available.
                // Built-in web browser provider (only one can exist as a time)
                // like MetaMask, Brave or Opera is added automatically by Web3modal
                const providerOptions = {
                    walletconnect: {
                        package: WalletConnectProvider,
                        options: {
                            // Mikko's test key - don't copy as your mileage may vary
                            rpc: {
                                80001: "https://matic-mumbai--jsonrpc.datahub.figment.io/apikey/f1f9f2031af0fbbd9d45fb6c87caf3c2",
                            },
                        },
                    },
                    coinbasewallet: {
                        package: CoinbaseWalletSDK,
                        options: {
                            appName: "Web 3 Modal Demo",
                            // infuraId: process.env.INFURA_KEY,
                        },
                        rpc: {
                            80001: "https://matic-mumbai--jsonrpc.datahub.figment.io/apikey/f1f9f2031af0fbbd9d45fb6c87caf3c2",
                        },
                    },
                }
                console.log(providerOptions)
                web3Modal = new Web3Modal({
                    cacheProvider: true, // optional
                    providerOptions, // required
                    disableInjectedProvider: false, // optional. For MetaMask / Brave / Opera.
                })
                console.log(web3Modal)

                try {
                    if (web3Modal.cachedProvider) {
                        provider = await web3Modal.connect()
                        const provider = await web3Modal.connect()
                        const library = new ethers.providers.Web3Provider(provider)
                        defaultEvmStores.setProvider(provider)
                    }
                    // setProvider(provider);
                    // setLibrary(library);
                } catch (error) {
                    console.error(error)
                }
                console.log("Web3Modal instance is", web3Modal)
            }
        } else
            try {
                connectWallet()
            } catch (error) {
                console.error(error)
            }
    } catch (error) {
        console.error(error)
    }
}

export function loadContracts() {
    defaultEvmStores.attachContract(contractName, contractAddress, JSON.stringify(abi))
}

/**
 * Connect wallet button pressed.
 */
export async function onConnect() {
    console.log("Opening a dialog", web3Modal)
    try {
        provider = await web3Modal.connect()
        defaultEvmStores.setProvider(provider)
    } catch (e) {
        console.log("Could not get a wallet connection", e)
        return
    }
}

/**
 * Disconnect wallet button pressed.
 */
export async function onDisconnect() {
    console.log("Killing the wallet connection", provider)

    // TODO: Which providers have close method?
    if (provider.close || provider == null) {
        await provider.close()

        // If the cached provider is not cleared,
        // WalletConnect will default to the existing session
        // and does not allow to re-scan the QR code with a new wallet.
        // Depending on your use case you may want or want not his behavir.
    }
    await web3Modal.clearCachedProvider()
    defaultEvmStores.disconnect()
    provider = null
}
