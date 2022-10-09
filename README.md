# **SmartCow Protocol**

![SmartCow Banner](./img/banner.png)

**SmartCow Protocol** is an automatic DCA protocol built on top of **CowSwap**. It allows users to execute a dollar-cost-average strategy in DeFi by means of streaming funds (via **Superfluid**) from the user's wallet into the protocol, unwrapping and executing CowSwap orders when a certain pre-established threshold (i.e. condition) is reached.

These actions are executed periodically thanks to **Chainlink**'s automation tools (**Chainlink Keepers**).

## Technical implementation

This project combines a CowSwap ERC-1271 standard compliant interface with Superfluid's asset streaming protocol. This way, the protocol automatically opens a stream of funds on behalf of the user, which are unwrapped and posted in a swap order when a certain pre-established threshold of funds is reached. Therefore, our protocol is both a super app (Superfluid) and a `CowOnchainOrder`. 

This is possible because the signature needed to post the swap order will only be valid once the threshold of funds is reached.

To make this process as continuous as possible (not a one-time event), we are using Chainlink Keepers to automate DCA swap order placement. Our contract both performs upkeeps and register upkeeps for users.