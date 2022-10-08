import { ethers } from 'ethers';
// import { defaultEvmStores } from 'svelte-ethers-store';
import { defaultEvmStores } from 'svelte-web3'
// import Web3Modal from "web3modal"
// import Web3Modal from './Web3Modal.svelte'

import abi from './abi/ourContract.json';

// Web3modal instance
let web3Modal

// Chosen wallet provider given by the dialog window
// let provider;


const providerOptions = {
    /* See Provider Options Section */
}

// let web3Modal = new Web3Modal({
//     network: "mainnet", // optional
//     cacheProvider: true, // optional
//     providerOptions, // required
// })

// const instance = await web3Modal.connect()

// let provider = new ethers.providers.Web3Provider(instance)
// const signer = provider.getSigner()

// export async function onConnect() {


//     try {
//       const provider = await web3Modal.connect();
//       const library = new ethers.providers.Web3Provider(provider);
//       const accounts = await library.listAccounts();
//       const network = await library.getNetwork();
//       setProvider(provider);
//       setLibrary(library);
//       if (accounts) setAccount(accounts[0]);
//       setChainId(network.chainId);
//     } catch (error) {
//       setError(error);
//     }
// }



/**
 * Setup the orchestra
 */
export async function init() {
  const WalletConnectProvider = window.WalletConnectProvider.default;
  
  console.log("Initializing example");
  console.log("WalletConnectProvider is", WalletConnectProvider);
  console.log("window.web3 is", ethers, "window.ethereum is", window.ethereum);
  
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
          rpc : {80001: "https://matic-mumbai--jsonrpc.datahub.figment.io/apikey/f1f9f2031af0fbbd9d45fb6c87caf3c2"},
      }
    },
  };
  
  web3Modal = new window.Web3Modal.default({
    cacheProvider: true, // optional
    providerOptions, // required
    disableInjectedProvider: false, // optional. For MetaMask / Brave / Opera.
  });
  
  if (web3Modal.cachedProvider) {
    provider = await web3Modal.connect();
    defaultEvmStores.setProvider(provider);
  }
  console.log("Web3Modal instance is", web3Modal);
}

export function loadContracts() {
  defaultEvmStores.attachContract('ourContract', 'addressOfOurContract', JSON.stringify(abi));
}


/**
 * Connect wallet button pressed.
 */
export async function onConnect() {

  console.log("Opening a dialog", web3Modal);
  try {
    // const web3Modal = new Web3Modal(<providerOptions>)
    const provider = await web3Modal.connect()
    defaultEvmStores.setProvider(provider)
    provider = await web3Modal.connect();
    defaultEvmStores.setProvider(provider);
  } catch(e) {
    console.log("Could not get a wallet connection", e);
    return;
  }

}

/**
 * Disconnect wallet button pressed.
 */
export async function onDisconnect() {

  console.log("Killing the wallet connection", provider);

  // TODO: Which providers have close method?
  if (provider.close) {
    await provider.close();

    // If the cached provider is not cleared,
    // WalletConnect will default to the existing session
    // and does not allow to re-scan the QR code with a new wallet.
    // Depending on your use case you may want or want not his behavior.
  }
  await web3Modal.clearCachedProvider();
  defaultEvmStores.disconnect();
  provider = null;

}