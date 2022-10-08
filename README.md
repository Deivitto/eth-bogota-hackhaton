# ETH Bogotá Hackaton project

## Idea

Build some stuff with Cowswap.

## Resources

- [CowSwap Workshop Slides](https://docs.google.com/presentation/d/1ZauQFC80DeqDGTevZHSWOBz5ahAbiT3fdObhqLS888A/edit)
- [Demo Repo](https://github.com/fleupold/dappcon-2022-smart-orders)
- [Docs](https://docs.cow.fi/tutorials/how-to-place-erc-1271-smart-contract-orders)
- [A video](https://www.youtube.com/watch?v=5RHx4AiaUCM)
- [Another video](https://youtu.be/tRnH5FmY8y8)

## Bounties to snipe

### **Cowswap**
With ERC-1271, smart contracts can now sign messages as if they were EOAs (Externally Owned Accounts, like MetaMask).

On CoW Swap, EOA users don’t pay gas and never pay for failed transactions because they sign messages to place their orders — but smart contracts don’t get these same benefits, since (before ERC-1271) they must place their order with an on-chain transaction.

🥇 We will award $5000 to the team that builds the most-creative demo of ERC-1271 to place orders on CoW Protocol, giving as many unique benefits as possible to smart contract users.

An extra $2500 is available if you attach an interesting front-end to your solution.

### **Wallet Connect**

Obviously because it's an easy implementation. It's better to use v2 because it looks good.

WalletConnect is the web3 communications protocol enabling wallets and apps to securely connect. Our mission is to expand interoperability and realize richer experiences by providing developers with the infrastructure and tools that underpin user interaction in web3. The recently-launched WalletConnect v2.0 takes our interoperability promise one step further with multi-chain support, allowing developers to build and achieve compatibility across blockchains and roll-ups.

Learn more at walletconnect.com/

### **Metamask**

Maybe a notification system?! Within a snap?

Develop a Snap utilizing our recent features and APIs:

- Transaction Insights Bring your insights, anti-phishing, and security solutions to the MetaMask UI with the transaction insights API.
- Notifications MetaMask Flask introduces a generic notifications interface that can be utilized by any snap with the notifications permission. A short notification text can be triggered by a snap for actionable or time-sensitive information.
- Custom confirmation screen Show a MetaMask popup with custom text and buttons to approve or reject an action. This can be used to create requests, confirmations, and opt-in flows for a snap.

### **Coinbase**

Use coinbase cloud and coinbase wallet. Easy money.

Coinbase Cloud is committed to empowering crypto developers by making it easier and faster for them to build their applications. Developers can integrate with the APIs powering Coinbase from a single documentation site at coinbase.com/cloud. Guides and references make it easy for developers to incorporate key crypto primitives like node, trading, and payments into their products and services. Developers can now set up an account at https://console.cloud.coinbase.com/ and begin building with Coinbase APIs using Node! We will continue to release additional APIs, tools, and services as part of Coinbase Cloud. This is only a first step in what’s to come as we work with the web3 community to build the future of web3.

### **Push protocol**

Maybe push message to a wallet whenever an order on cowswap has been settled?

Push Protocol is the communication protocol of web3. Push protocol enables cross-chain notifications and messaging for dapps, wallets, and services tied to wallet addresses in an open, gasless, and platform agnostic fashion. The open communication layer allows any crypto wallet / frontend to tap into the network and get the communication across.

### **Superfluid**

Since we're doing something related to DeFi, including streams could be interesting... Dunno.

Superfluid is the leading asset streaming protocol that enables Web3 native subscriptions, salaries, and rewards for DAOs and crypto-native businesses. Superfluid streams transfer value in a constant flow over time between wallets in a non-custodial and permissionless manner. Superfluid Protocol can be used to describe cash flows and execute them automatically on-chain, over time, and in a non-interactive way. Money streams are programmable, composable, and modular, allowing developers to build custom applications on top of the protocol. No capital is locked up, and all inflows and outflows are netted in real-time at every block without consuming any gas. Ongoing streams can be forwarded as they are received to both wallets and applications, eliminating delays and drastically increasing capital efficiency.

### **Autonomy**

Maybe introduce this to automate orders?

Autonomy Network is a decentralized automation protocol. It allows anyone to do arbitrary actions and have them execute in the future under arbitrary conditions, even while the user is offline. Developers use Autonomy to add features to their dapps that require automation. For example, DEXes can add limit orders/stop losses, DAOs can do recurring payments for salaries, lending platforms can do auto-repaying loans. It’s infrastructure, like ChainLink, but for automation, not oracles. Autonomy is live on the major EVM chains, Solana, and soon more non-EVM chains.

AutoStation is a no-code interface for automating things, like Zapier but decentralized and a platform. People can upload conditions or actions for other people to use, and this prize is for coming up with the best condition or action and uploading it to AutoStation for people to use.

Some ideas for conditions you could create:

- TWAP price on DEXes
- The collateral ratio of a loan
- Some ideas for actions you could create:
- Withdrawing liquidity from a DEX (e.g. if paired with a condition of prices, this acts like a 'stop loss' for LPing, therefore limiting impermanent loss)
- Repaying/taking out a loan (e.g. paired with the collateral ratio condition)
- Rebalancing a portfolio (e.g. every time it moves off of some metric by 1% or something)
- Compounding yield in a yield farm (e.g. pair with a time condition for doing that every day)

### **Chainlink**

To monitor pricefeeds?

Chainlink greatly expands the capabilities of smart contracts by enabling access to real-world data and off-chain computation while maintaining the security and reliability guarantees inherent to blockchain technology. With Price Feeds, Verifiable Randomness, Upkeeps, and making any kind of API call, you can empower your application to do virtually anything. There is an abundance of resources in the Chainlink documentation for any developer at any level to get started.

### **Gnosis Chain**

Since we are testing on Gnosis...

The Gnosis Chain is a stable payments EVM (Ethereum Virtual Machine) blockchain designed for fast and inexpensive transactions. The chain uses a unique dual-token model; xDai is a stable token used for transactions, payments, and fees, and Proof of Stake protection will be provided by GNO with the consensus-layer Gnosis Beacon Chain.

## Judging.

- 4 minutes to demo (also record a video of it).
- Submit video
- Submit and add all details to dashboard
- Specify bounties we wanna go for in the submission process. Then we have to demo what we build **WHILE** the main judging is happening. We will get assigned an order for main judging, so we have to adapt for the bounties

**THIS TAKES AROUND 30 MINUTES SO DON'T DO IT LAST MINUTES**

## Run the Web
```bash
yarn install
npm run dev -- --open
```
