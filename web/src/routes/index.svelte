<script context="module">
    export const prerender = true
</script>

<script>
    import { connected, signerAddress, chainId } from "svelte-ethers-store"

    import SvgCheck from "$lib/svgCheck.svelte"
    import { onConnect, onDisconnect } from "$lib/web3"

    async function changeNetwork() {
        const CHAIN_ID = 80001
        const HEXCHAIN_ID = "0x" + CHAIN_ID.toString(16)
        try {
            await window.ethereum.request({
                method: "wallet_addEthereumChain",
                params: [
                    {
                        chainId: HEXCHAIN_ID,
                        chainName: "Mumbai testnet",
                        nativeCurrency: {
                            name: "Matic",
                            symbol: "MATIC",
                            decimals: 18,
                        },
                        rpcUrls: [
                            "https://matic-mumbai--jsonrpc.datahub.figment.io/apikey/f1f9f2031af0fbbd9d45fb6c87caf3c2",
                            // "https://rpc-mumbai.matic.today/",
                            // "https://matic-mumbai.chainstacklabs.com",
                            // "https://rpc-mumbai.maticvigil.com/",
                            // "https://matic-testnet-archive-rpc.bwarelabs.com/"
                        ],
                        blockExplorerUrls: ["https://mumbai.polygonscan.com/"],
                    },
                ],
            })
            setTimeout(() => {
                document.location.reload()
            }, 10)
        } catch (e) {
            console.log(e)
            alert("Please manually change your network to Mumbai testnet")
        }
    }
    console.log($connected)
</script>

<div class="index">
    <div
        class="from-primary to-secondary text-primary-content -mt-[4rem] grid place-items-center items-end bg-gradient-to-br pt-20"
    >
        <div
            class="hero-content col-start-1 row-start-1 w-full max-w-7xl flex-col justify-between gap-10 pb-20 lg:flex-row lg:items-end lg:gap-0 xl:gap-20"
        >
            <div class="lg:px-10 lg:pb-12">
                <h1 class="font-title mb-2 py-4 font-extrabold lg:py-10">
                    {#if $connected}
                        <div class="floating-button-container btn btn-tertiary ">
                            <!-- content -->
                            {#if $chainId == 80001}
                                <button class="floating-button-wallet" on:click={onDisconnect}>
                                    {$signerAddress.slice(0, 4)}...{$signerAddress.slice(-4)}
                                    <span class="floating-button-address" />
                                </button>
                            {:else}
                                <button class="floating-button-wallet" on:click={changeNetwork}>
                                    WRONG NETWORK!
                                    <span class="floating-button-address" />
                                </button>
                            {/if}
                        </div>
                    {/if}
                    <!-- <div class="logo-container  ">
              <a href="/"
                ><img
                  class="logo-image"
                  src="./sponsrethgold2.png"
                  alt="milk.eth"
                /></a
              >
            </div> -->

                    <div class="mb-2 text-5xl lg:text-7xl title_milketh">milk_chains.eth</div>
                    <div class="text-2xl lg:text-3xl pt-4 subtitle_milketh">
                        Work with your transactions in the best way!<br />
                        <!-- somethnig more here??-->
                    </div>
                </h1>
                <div
                    class="flex w-full flex-col items-start space-y-10 lg:flex-row lg:space-x-4 lg:space-y-0"
                >
                    <div class="my-2 flex max-w-sm flex-col gap-2 text-left padding-small-screen">
                        <div class="flex gap-2">
                            <SvgCheck />
                            Easy to use and made for everyone
                        </div>
                        <div class="flex gap-2">
                            <SvgCheck />
                            Avoid MEV bots
                        </div>
                        <div class="flex gap-2">
                            <SvgCheck />
                            Multichain compatible
                        </div>
                        <div class="flex gap-2">
                            <SvgCheck />
                            Compatible with a wide range of tokens
                        </div>
                    </div>
                </div>
                <div
                    class="starting-buttons mt-4 flex flex-1 pt-6 justify-center space-x-2 sm:justify-start lg:mt-6 lg:justify-start"
                >
                    {#if !$connected}
                        <button
                            on:click={onConnect}
                            class="btn button-first-section btn-ghost btn-active lg:btn-lg normal-case"
                        >
                            Connect
                        </button>
                        <!-- <a href="#how" class="btn lg:btn-lg normal-case">How does it work?</a> -->
                    {:else}
                        <a
                            href="/aggregator-swap"
                            class="btn button-first-section btn-ghost btn-active lg:btn-lg normal-case"
                        >
                            Agreggator
                        </a>
                        <a href="/faq" class="btn button-first-section lg:btn-lg normal-case">FAQ</a
                        >
                    {/if}
                    <a
                        href="/check-txs"
                        class="btn btn-tertiary button-first-section btn-active lg:btn-lg normal-case"
                    >
                        Check CoW transactions
                    </a>
                </div>
                <!-- <img
                    class="ethereum-gif"
                    src="/ethereum-logo.gif"
                    alt="Ethereum logo"
                    width="250"
                /> -->
            </div>
        </div>
        <svg
            class="fill-secondary col-start-1 row-start-1 h-auto w-full"
            width="1600"
            height="595"
            viewBox="0 0 1600 595"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M0 338L53.3 349.2C106.7 360.3 213.3 382.7 320 393.8C426.7 405 533.3 405 640 359.3C746.7 313.7 853.3 222.3 960 189.2C1066.7 156 1173.3 181 1280 159.2C1386.7 137.3 1493.3 68.7 1546.7 34.3L1600 0V595H1546.7C1493.3 595 1386.7 595 1280 595C1173.3 595 1066.7 595 960 595C853.3 595 746.7 595 640 595C533.3 595 426.7 595 320 595C213.3 595 106.7 595 53.3 595H0V338Z"
            />
        </svg>
    </div>

    <!-- {$signerAddress} -->

    <div class="hero bg-base-100 text-base-content mx-auto min-h-screen max-w-md md:max-w-full">
        <div class="hero-content px-4 text-center md:px-0">
            <div id="how">
                <h2 class="mt-32 mb-2 text-4xl font-extrabold md:text-6xl">How does it work?</h2>
                <h3 class="mb-5 text-3xl font-bold">As simple as a regular transaction</h3>
                <p class="mx-auto  mb-5 w-full max-w-lg" style="font-size: 20px">
                    milk_chains.eth aims to help regular users to perform transactions in the more
                    efficient and effective way
                </p>

                <p />
                <div class="mt-10 mb-20 flex flex-col lg:flex-row" style="font-size: 20px">
                    <div class="flex w-full flex-col text-left">
                        <div class=" mx-auto w-full max-w-xs flex-grow sm:max-w-md">
                            Users can both <b>create a CoW transaction</b> or
                            <b>browse CoW transactions</b>
                            available for sponsoring. To get sponsored, follow these steps:
                            <ul class="steps steps-vertical">
                                <li class="step"><b>Create your transaction</b></li>
                                <li class="step">LOREM IPSUM</li>
                                <li class="step">LOREM IPSUM</li>
                                <li class="step">LOREM IPSUM</li>
                            </ul>
                        </div>
                        <div class="mt-4 flex h-16 items-start justify-center">
                            <a
                                class="btn-what-is-a-transaction inline-block cursor-pointer rounded-md bg-indigo-600 px-4 py-3 text-center text-sm
                       font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-indigo-700"
                                href="#transaction">What is a transaction?</a
                            >
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div
        class="hero from-primary to-accent text-primary-content min-h-screen bg-gradient-to-br"
        id="private"
    >
        <div class="hero-content mx-auto max-w-md text-center md:max-w-full">
            <div id="transaction">
                <h2 class="mt-20 mb-12 text-4xl font-extrabold md:text-6xl">
                    What is a transaction with CoW?
                </h2>
                <!-- <h3 class="mb-5 text-3xl font-bold">Lorem ipsum</h3> -->
                <p class="mx-auto mb-5 w-full regular-text lh-regular">LOREM IPSUM</p>

                <div class="my-20 flex flex-col custom-button-centered">
                    <a class="btn btn-tertiary  rounded-full" href="/create-sponsor"
                        >Create your first CoW transaction!</a
                    >
                </div>
            </div>
        </div>
    </div>

    <div
        class="hero from-primary to-accent text-primary-content min-h-screen bg-gradient-to-br"
        id="private"
    >
        <div class="hero-content mx-auto max-w-md text-center md:max-w-full">
            <div>
                <h2 class="mt-20 mb-8  text-4xl font-extrabold md:text-6xl">Browse transactions</h2>
                <h3 class="mb-5 text-3xl font-bold regular-text-title">
                    Looking for your optimal transactions? This is your place!
                </h3>
                <p class="mx-auto mb-5 w-full max-w-l regular-text-smaller">
                    Search transactions with our easy to use interface<br />
                    LOREM IPSUM EXPLANATION
                </p>

                <div
                    class="my-20 flex flex-col md:flex-row custom-button-centered space-between md:gap-4"
                >
                    <a
                        class="btn  btn-tertiary btn-outline rounded-full w-full md:w-1/2"
                        href="/mistery-transactions">Mistery button</a
                    >
                    <br />
                    <a
                        class="btn btn-primary rounded-full w-full md:w-1/2 "
                        href="/browse-transactions"
                    >
                        Browse transactions!</a
                    >
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .step {
        text-align: left;
    }

    .custom-button-centered {
        max-width: 550px;
        margin-left: auto;
        margin-right: auto;
    }

    .floating-button-container {
        position: fixed;
        top: 1.5rem;
        right: 2rem;
        border-radius: 8px;
    }

    /* .floating-button-container:after {
      content: "x";
      font-size: 8px;
      position: relative;
      width: 0;
      height: 0;
      top: -22px;
      right: -4px;
    } */

    .btn-what-is-a-transaction {
        padding: 1rem 4.2rem;
        font-size: 16px;
        border-radius: 35px;
        white-space: nowrap;
        /* min-height: 4rem; */
    }

    .lh-regular {
        line-height: 1.5;
    }

    .regular-text {
        font-size: 22px;
        max-width: 60%;
    }

    .regular-text-smaller {
        font-size: 20px;
        max-width: 60%;
    }

    .regular-text-title {
        font-size: 28px;
        max-width: 60%;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
        font-weight: 500;
        margin-bottom: 2rem;
    }

    .logo-image {
        border-radius: 35px;
        max-width: 165px;
        /* margin-left: auto; */
        margin-right: auto;
        transition: ease 0.5s;
        margin-top: -2rem;
    }

    .starting-buttons {
        flex-wrap: wrap;
        gap: 1rem;
    }

    .starting-buttons > * {
        margin: 0;
    }

    .button-charming {
        height: 3rem;
        border-radius: 8px;
        padding: 0 2rem;
        background: linear-gradient(-45deg, #9925ea, #338aff, #9925ea);
        background-size: 400%;
        background-position: 90% 0;
        color: #fff;
        transition: background 0.8s;
        border: none;
    }

    .button-charming:hover {
        background-position: 185% 50%;
    }

    .button-first-section {
        min-width: 250px;
        transition: 0.5s ease;
    }

    .button-first-section:hover {
        /*  */
        filter: brightness(0.8);
    }

    @media (min-width: 1468px) {
        .ethereum-gif {
            position: absolute;
            right: 4rem;
            top: 1.8rem;
            height: 70p;
            width: 180px;
        }
    }

    .ethereum-gif {
        display: none;
    }

    @media (max-width: 768px) {
        .max-w-md {
            max-width: 100%;
        }

        .custom-button-centered > button {
            max-width: 90%;
            margin-left: auto;
            margin-right: auto;
        }

        .regular-text-smaller,
        .regular-text-title,
        .regular-text {
            max-width: 90%;
        }

        .padding-small-screen {
            padding: 1rem 0;
        }

        button,
        a {
            min-width: 200px;
        }
    }

    @media (max-width: 576px) {
        .steps-vertical .step {
            gap: 0;
        }
        .button-first-section {
            min-width: 180px;
        }

        button,
        a {
            min-width: auto;
        }

        .title_milketh {
            /* font-size: 2rem; */
        }

        .subtitle_milketh {
            /* font-size: 1.4rem; */
        }
    }

    @media (max-width: 426px) {
        .title_milketh {
            font-size: 2rem;
        }

        .subtitle_milketh {
            font-size: 1.4rem;
        }

        .stroke-current > path {
            min-width: 24px;
            min-height: 24px;
        }

        .button-first-section {
            min-width: 40%;
        }
    }
</style>
