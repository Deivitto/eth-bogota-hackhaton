<script context="module">
    export const prerender = true
</script>

<script>
    import { connected, signerAddress, chainId } from "svelte-ethers-store"
    import Wallet from "$lib/WalletAddress.svelte"
    import SvgLogo from "$lib/svgLogo.svelte"
    import { onConnect, onDisconnect, connectWallet } from "$lib/web3"

    var ping = 23123927
    var chain = "Arbitrum"
    var address = "0x000test"
    var token1 = "ETH"
    var balance = 0
    // $: ping = 23123927
    // $: chain = "Arbitrum"
    // $: address = "0x000test"
    // $: token1 = "ETH"
    // $: balance = 0

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
</script>

<section>
    <div id="root">
        <div class="sc-1dv6j2d-0 gEuJQl">
            <div class="sc-1dv6j2d-2 fjHwBb">
                <div class="sc-pradxg-0 cDPxHR">
                    <a href="." class="sc-pradxg-8 gJaIbL"
                        ><div class="sc-pradxg-9 hzptBO">
                            <!-- <div class="logo-container ">
                                <a href="/"
                                    ><img
                                        class="logo-image"
                                        src="./home_logo.png"
                                        alt="home_logo.eth"
                                    /></a
                                >
                            </div> -->
                            <!-- <svg
                            width="24px"
                            height="100%"
                            viewBox="0 0 14 15"
                            fill="#FFFFFF"
                            xmlns="http://www.w3.org/2000/svg"
                            ><title>logo</title></svg 
                            > @audit svg with logo
                        
                        -->
                            <SvgLogo />
                        </div></a
                    >
                    <div class="sc-bczRLJ sc-nrd8cx-0 sc-pradxg-3 hJYFVB gBBPoP gkNDVh">
                        <a
                            id="swap-nav-link"
                            class="sc-pradxg-10 gfRsre active"
                            href="#/swap"
                            aria-current="page">Swap</a
                        >
                        {#if !$connected}
                            <a
                                data-cy="pool-nav-link"
                                id="pool-nav-link"
                                class="sc-pradxg-10 gfRsre"
                                href="#/pool">Pool</a
                            >
                            <button
                                on:click={onConnect}
                                class="btn button-first-section btn-ghost btn-active lg:btn-lg normal-case"
                            >
                                Connect
                            </button>
                        {/if}

                        <!-- <a
                            data-cy="pool-nav-link"
                            id="pool-nav-link"
                            class="sc-pradxg-10 gfRsre"
                            href="#/pool">Pool</a
                        ><a
                            target="_blank"
                            rel="noopener noreferrer"
                            href="https://info.uniswap.org/#/arbitrum"
                            id="charts-nav-link"
                            class="sc-1cchcrx-10 dVAOBx sc-pradxg-11 kskfLb">Charts<sup>↗</sup></a
                        > -->
                    </div>
                    <div class="sc-pradxg-1 byWPhu">
                        <div class="sc-pradxg-2 laabeG">
                            <div class="sc-w04zhs-15 cMNjRs">
                                <div class="sc-w04zhs-13 jeYMQh">
                                    <img
                                        src="./static/media/arbitrum_logo.ec8e5080.svg"
                                        class="sc-w04zhs-9 sc-w04zhs-14 dxNFXs ekjeVf"
                                    />
                                    <div class="sc-w04zhs-10 sc-w04zhs-11 hytLrO hivUOx">
                                        {chain}
                                    </div>
                                    <!--TODO: CHAIN //@audit also the upper image link -->
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="currentColor"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        class="sc-w04zhs-16 lfEMTx"
                                        ><polyline points="6 9 12 15 18 9" /></svg
                                    >
                                </div>
                            </div>
                        </div>
                        <!-- <div class="sc-pradxg-2 laabeG">
                            <div class="sc-pradxg-4 eKAXzW">
                                <div
                                    class="sc-pradxg-7 bYIEGZ css-z9m35u"
                                    style="flex-shrink: 0; user-select: none;"
                                >
                                    {balance}
                                </div>
                                <span
                                    ><button
                                        data-testid="web3-status-connected"
                                        class="sc-bczRLJ lfsInV sc-fwrjc2-0 sc-fwrjc2-4 sc-m6ivbz-0 sc-m6ivbz-4 ffWXsK hYTqPD ihvkLg jnTWTk"
                                        ><p class="sc-m6ivbz-5 ldiIWn">asdas{address}</p>
                                        <div size="16" class="sc-16lz3aa-0 hVuOEJ">
                                            <div class="sc-z4caw7-0 fyqfbY">
                                                <span
                                                    ><div
                                                        style="border-radius: 50px; overflow: hidden; padding: 0px; margin: 0px; width: 16px; height: 16px; display: inline-block; background: rgb(250, 58, 0);"
                                                    >
                                                        <svg x="0" y="0" width="16" height="16"
                                                            ><rect
                                                                x="0"
                                                                y="0"
                                                                width="16"
                                                                height="16"
                                                                transform="translate(2.098874115463103 -0.07934382970125567) rotate(456.5 8 8)"
                                                                fill="#C81477"
                                                            /><rect
                                                                x="0"
                                                                y="0"
                                                                width="16"
                                                                height="16"
                                                                transform="translate(-3.214964086684321 -7.956033443566552) rotate(319.5 8 8)"
                                                                fill="#F90501"
                                                            /><rect
                                                                x="0"
                                                                y="0"
                                                                width="16"
                                                                height="16"
                                                                transform="translate(4.206701226478874 -14.292925700943588) rotate(358.9 8 8)"
                                                                fill="#FB1895"
                                                            /></svg
                                                        >
                                                    </div></span
                                                >
                                            </div>
                                        </div></button
                                    ></span
                                >
                            </div>
                        </div> -->
                        <!-- Wallet block -->
                        {#if $connected}
                            <div class="floating-button-container btn btn-tertiar ">
                                <!-- content -->
                                {#if $chainId == 80001}
                                    <!-- {start_string}{end_string} -->
                                    <div on:click={onDisconnect}>
                                        <Wallet />
                                    </div>

                                    <!-- <button class="floating-button-wallet" on:click={onDisconnect}>
                                asdasdasdas
                                <span class="floating-button-address" />
                            </button> -->
                                {:else}
                                    <button class="floating-button-wallet" on:click={changeNetwork}>
                                        WRONG NETWORK!
                                        <span class="floating-button-address" />
                                    </button>
                                {/if}
                            </div>
                        {/if}
                        <!-- end wallet block -->
                        <div class="sc-pradxg-2 laabeG">
                            <div class="sc-12ipqmu-3 YWqOk">
                                <button aria-label="Menú" class="sc-12ipqmu-1 iveUAE"
                                    ><svg
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                        class="sc-12ipqmu-0 cTLUfZ"
                                        ><path
                                            d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z"
                                            stroke="black"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                        /><path
                                            d="M19 13C19.5523 13 20 12.5523 20 12C20 11.4477 19.5523 11 19 11C18.4477 11 18 11.4477 18 12C18 12.5523 18.4477 13 19 13Z"
                                            stroke="black"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                        /><path
                                            d="M5 13C5.55228 13 6 12.5523 6 12C6 11.4477 5.55228 11 5 11C4.44772 11 4 11.4477 4 12C4 12.5523 4.44772 13 5 13Z"
                                            stroke="black"
                                            stroke-width="2"
                                            stroke-linecap="round"
                                            stroke-linejoin="round"
                                        /></svg
                                    ></button
                                >
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="sc-1dv6j2d-1 cppDvG">
                <div class="sc-1kykgp9-2 sc-fo3pji-2 hinUJE leVPqs" />
                <div height="0" class="sc-fo3pji-0 bqnskO"><div class="sc-fo3pji-1 gLdiTM" /></div>
                <div class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-4 hJYFVB gBBPoP leSroW">
                    <div class="sc-123dig8-0 dNrztM">
                        <a
                            target="_blank"
                            rel="noopener noreferrer"
                            href="https://etherscan.io/gastracker"
                            class="sc-1cchcrx-10 dVAOBx"
                        />
                        <div class="sc-18nh1jk-0 horBTe sc-123dig8-1 dCKcsh css-x9zcw6">
                            <a
                                target="_blank"
                                rel="noopener noreferrer"
                                href="https://arbiscan.io/block/29133853"
                                class="sc-1cchcrx-10 dVAOBx"
                                ><div class="sc-d5tbhs-1 cSretk"><div>{ping}&ensp;</div></div></a
                            >
                        </div>
                        <div class="sc-123dig8-2 bfesFx" />
                    </div>
                </div>
                <div
                    class="_1klryar0 rgw6ez3lg rgw6ez3lb rgw6ez14g rgw6ez15b rgw6ez1ay rgw6ez1bt rgw6ez43g rgw6ez2z4 rgw6ez34h rgw6ez39y rgw6ez34n rgw6ez3a4 rgw6ez3fh rgw6ez3z4"
                >
                    <div
                        class="_1klryar0 rgw6ez3zg rgw6ez41s rgw6eztm rgw6ezu5 rgw6ezo4 rgw6ezpz rgw6ez14g rgw6ez13t rgw6ez1ay rgw6ez1bt rgw6ez5im rgw6ezim rgw6ez424 _1qffq9m1 rgw6ez6a6 rgw6ez6i2 rgw6ez692 rgw6ez4qg"
                    >
                        <div class="_1klryar0 rgw6ez43m rgw6ez3la rgw6ez2kg rgw6ez28s rgw6ez2ea">
                            <div
                                class="_1klryar0 rgw6ez27m rgw6ez2d4 rgw6ez2im rgw6ez22y rgw6ez3fm rgw6ezca rgw6ezas rgw6ez6mi"
                            >
                                Selected items
                            </div>
                        </div>
                        <div
                            class="_1klryar0 rgw6ez3zg rgw6ez41s rgw6ez6jy rgw6ez6ky rgw6ez43m rgw6ez2ja rgw6ez22s rgw6ez1ay _1qffq9m3 rgw6ez1vg"
                        />
                        <div class="_1klryar0 rgw6ez2pa">
                            <button
                                class="_1klryar0 _127l8hdi rgw6ezcm rgw6ezam rgw6ez6ma _127l8hdg rgw6ez69u rgw6ez6n2 rgw6ez6lb rgw6ez5ks rgw6ez46m _1qffq9m6 rgw6ez27m rgw6ez2d4 rgw6ez2js rgw6ez23a rgw6ez14g"
                                disabled="">Continue</button
                            >
                        </div>
                    </div>
                </div>
                <div class="sc-11ce2lf-0 bDmHPU">
                    <main id="swap-page" class="sc-11ce2lf-1 bAkuEV">
                        <div class="sc-jhay2b-0 cYRbzL">
                            <div class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-1 hJYFVB gBBPoP frnZMK">
                                <div class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-4 hJYFVB gBBPoP leSroW">
                                    <div
                                        class="sc-18nh1jk-0 htCzKB css-dz8bsg"
                                        style="margin-right: 8px;"
                                    >
                                        Swap
                                    </div>
                                </div>
                                <div class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-4 hJYFVB gBBPoP leSroW">
                                    <div class="sc-1ndknrv-4 jMMxfi">
                                        <button
                                            id="open-settings-dialog-button"
                                            aria-label="Ajustes de la transacción"
                                            class="sc-1ndknrv-2 iDWMMh"
                                            ><svg
                                                xmlns="http://www.w3.org/2000/svg"
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                stroke="currentColor"
                                                stroke-width="2"
                                                stroke-linecap="round"
                                                stroke-linejoin="round"
                                                class="sc-1ndknrv-0 lbfZs"
                                                ><circle cx="12" cy="12" r="3" /><path
                                                    d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"
                                                /></svg
                                            ></button
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="sc-1es900k-1 cRzsB">
                                <div
                                    id="swap-currency-input"
                                    label="[object Object]"
                                    class="sc-3zewi2-0 hTfAkf"
                                >
                                    <div class="sc-3zewi2-2 gbCyiT">
                                        <div class="sc-3zewi2-4 gURECW">
                                            <input
                                                class="sc-1x3stf0-0 hrUmAB sc-3zewi2-11 fBFHRe token-amount-input"
                                                inputmode="decimal"
                                                autocomplete="off"
                                                autocorrect="off"
                                                type="text"
                                                pattern="^[0-9]*[.,]?[0-9]*$"
                                                placeholder="0.0"
                                                minlength="1"
                                                maxlength="79"
                                                spellcheck="false"
                                                value=""
                                            /><button
                                                class="sc-bczRLJ lfsInV sc-fwrjc2-0 sc-fwrjc2-3 sc-3zewi2-3 ffWXsK cvxPtY usljI open-currency-select-button"
                                                ><span class="sc-3zewi2-7 dBwdwc"
                                                    ><div
                                                        class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-4 hJYFVB gBBPoP leSroW"
                                                    >
                                                        <img
                                                            class="sc-1fvnadz-0 sc-1fvnadz-1 iTKKBi dXNPyx"
                                                            alt="{token1} logo"
                                                            src="data:image/png;base64,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"
                                                            style="margin-right: 2px;"
                                                        /><span
                                                            class="sc-3zewi2-9 cDshyY token-symbol-container"
                                                            >{token1}</span
                                                        >
                                                    </div>
                                                    <svg
                                                        width="12"
                                                        height="7"
                                                        viewBox="0 0 12 7"
                                                        fill="none"
                                                        xmlns="http://www.w3.org/2000/svg"
                                                        class="sc-3zewi2-8 fmoquy"
                                                        ><path
                                                            d="M0.97168 1L6.20532 6L11.439 1"
                                                            stroke="#AEAEAE"
                                                        /></svg
                                                    ></span
                                                ></button
                                            >
                                        </div>
                                        <div class="sc-3zewi2-5 sc-3zewi2-6 fwbact gzdHPL">
                                            <div
                                                class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-1 hJYFVB gBBPoP frnZMK"
                                            >
                                                <div class="sc-u7b06n-1 eaouLI">
                                                    <div class="sc-18nh1jk-0 horBTe css-1io72gt" />
                                                </div>
                                                <div
                                                    class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-4 hJYFVB gBBPoP leSroW"
                                                    style="height: 17px;"
                                                >
                                                    <div
                                                        class="sc-18nh1jk-0 horBTe css-d8m55i"
                                                        style="display: inline;"
                                                    >
                                                        Balance: {balance}
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="sc-11ce2lf-2 eSeQEv">
                                <div color="#FFFFFF" class="sc-1es900k-0 hbdxeO">
                                    <svg
                                        xmlns="http://www.w3.org/2000/svg"
                                        width="16"
                                        height="16"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        stroke="#8F96AC"
                                        stroke-width="2"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        ><line x1="12" y1="5" x2="12" y2="19" /><polyline
                                            points="19 12 12 19 5 12"
                                        /></svg
                                    >
                                </div>
                            </div>
                        </div>
                        <div class="sc-1kykgp9-2 jgeUFu">
                            <div>
                                <div class="sc-1es900k-1 sc-1es900k-2 cRzsB cWTMKg">
                                    <div
                                        id="swap-currency-output"
                                        label="[object Object]"
                                        class="sc-3zewi2-0 hTfAkf"
                                    >
                                        <div class="sc-3zewi2-2 gbCyiT">
                                            <div class="sc-3zewi2-4 gURECW">
                                                <input
                                                    class="sc-1x3stf0-0 hrUmAB sc-3zewi2-11 fBFHRe token-amount-input"
                                                    inputmode="decimal"
                                                    autocomplete="off"
                                                    autocorrect="off"
                                                    type="text"
                                                    pattern="^[0-9]*[.,]?[0-9]*$"
                                                    placeholder="0.0"
                                                    minlength="1"
                                                    maxlength="79"
                                                    spellcheck="false"
                                                    value=""
                                                /><button
                                                    class="sc-bczRLJ lfsInV sc-fwrjc2-0 sc-fwrjc2-3 sc-3zewi2-3 ffWXsK cvxPtY cFhJnE open-currency-select-button"
                                                    ><span class="sc-3zewi2-7 dBwdwc"
                                                        ><div
                                                            class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-4 hJYFVB gBBPoP leSroW"
                                                        >
                                                            <span
                                                                class="sc-3zewi2-9 cDshyY token-symbol-container"
                                                                >Choose Token</span
                                                            >
                                                        </div>
                                                        <svg
                                                            width="12"
                                                            height="7"
                                                            viewBox="0 0 12 7"
                                                            fill="none"
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            class="sc-3zewi2-8 fmoquy"
                                                            ><path
                                                                d="M0.97168 1L6.20532 6L11.439 1"
                                                                stroke="#AEAEAE"
                                                            /></svg
                                                        ></span
                                                    ></button
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button
                                    id="swap-button"
                                    disabled=""
                                    class="sc-bczRLJ lfsInV sc-fwrjc2-0 sc-fwrjc2-1 ffWXsK deMEgA"
                                    ><div class="css-10ob8xa">Choose a Token</div></button
                                >
                            </div>
                        </div>
                    </main>
                    <div class="sc-17mb1wp-3 gbCBEO">
                        <div class="sc-17mb1wp-4 jIokLr">
                            <a
                                target="_blank"
                                rel="noopener noreferrer"
                                href="https://bridge.arbitrum.io/"
                                class="sc-1cchcrx-10 dVAOBx sc-17mb1wp-6 dxWPUJ"
                                ><div color="#0490ed" class="sc-17mb1wp-2 gYQqeL">
                                    <!-- <img
                                        src="./static/media/{chain}_logo.ec8e5080.svg"
                                        class="sc-17mb1wp-0 jarGGn"
                                    /> -->
                                    <div
                                        class="sc-bczRLJ sc-nrd8cx-0 sc-nrd8cx-3 hJYFVB gBBPoP kHFzEX"
                                    >
                                        <h2 class="sc-17mb1wp-5 hVaGkx">{chain} token bridge</h2>
                                        <span class="sc-1cchcrx-26 ilzBgG"
                                            >Deposit tokens to the {chain} network</span
                                        >
                                    </div>
                                </div>
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="24"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="#0490ed"
                                    stroke-width="2"
                                    stroke-linecap="round"
                                    stroke-linejoin="round"
                                    class="sc-17mb1wp-7 RMvMn"
                                    ><line x1="7" y1="17" x2="17" y2="7" /><polyline
                                        points="7 7 17 7 17 17"
                                    /></svg
                                ></a
                            >
                        </div>
                    </div>
                </div>
                <!-- <div class="sc-18nh1jk-0 horBTe sc-1a9mfh8-0 faTeWD css-x9zcw6">
                {company} available in:
                <a class="sc-1cchcrx-4 jPfvcU" href="#/swap?lng=en-US">English</a>
            </div> -->
                <div class="sc-1dv6j2d-3 fGBDxo" />
            </div>
        </div>
    </div>
    <div
        id="background-radial-gradient"
        style="width: 100vw; height: 100vh; transform: unset; background: radial-gradient(150.6% 98.22% at 48.06% 0%, rgba(130, 71, 229, 0.6) 0%, rgba(200, 168, 255, 0) 100%), rgb(31, 33, 40); background-blend-mode: overlay, normal;"
    />
</section>

<style>
    * {
        font-family: Inter, sans-serif;
        box-sizing: border-box;
    }
    body,
    html {
        margin: 0;
        padding: 0;
    }
    button {
        user-select: none;
    }
    html {
        font-size: 16px;
        font-variant: none;
        font-smooth: always;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        -webkit-tap-highlight-color: transparent;
    }
    #background-radial-gradient {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        pointer-events: none;
        width: 200vw;
        height: 200vh;
        background: radial-gradient(50% 50% at 50% 50%, #fc077d10 0, rgba(255, 255, 255, 0) 100%);
        transform: translate(-50vw, -100vh);
        z-index: -1;
    }
    html {
        min-height: 100%;
    }
    @media (prefers-color-scheme: dark) {
        html {
            background-color: #212429;
        }
    }
    @media (prefers-color-scheme: light) {
        html {
            background-color: #f7f8fa;
        }
    }
    :root {
        --reach-dialog: 1;
    }
    :root {
        --rgw6ez0: var(--genie-colors-accentFailure);
        --rgw6ez1: var(--genie-colors-accentFailureSoft);
        --rgw6ez2: var(--genie-colors-accentAction);
        --rgw6ez3: var(--genie-colors-accentActionSoft);
        --rgw6ez4: var(--genie-colors-explicitWhite);
        --rgw6ez5: var(--genie-colors-gold);
        --rgw6ez6: #209853;
        --rgw6ez7: var(--genie-colors-violet);
        --rgw6ez8: var(--genie-colors-backgroundFloating);
        --rgw6ez9: var(--genie-colors-backgroundInteractive);
        --rgw6eza: var(--genie-colors-backgroundModule);
        --rgw6ezb: var(--genie-colors-backgroundOutline);
        --rgw6ezc: var(--genie-colors-backgroundSurface);
        --rgw6ezd: var(--genie-colors-modalBackdrop);
        --rgw6eze: var(--genie-colors-stateOverlayHover);
        --rgw6ezf: var(--genie-colors-textPrimary);
        --rgw6ezg: var(--genie-colors-textSecondary);
        --rgw6ezh: var(--genie-colors-textTertiary);
        --rgw6ezi: #4c82fb;
        --rgw6ezj: linear-gradient(270deg, #d1d5db, #f6f6f6);
        --rgw6ezk: #24272e;
        --rgw6ezl: 0px 4px 16px rgba(70, 115, 250, 0.4);
        --rgw6ezm: #fa2c38;
        --rgw6ezn: #000;
        --rgw6ezo: #f5f5f5;
        --rgw6ezp: #4c82fb;
        --rgw6ezq: #cbcedc;
        --rgw6ezr: #7f7f7f;
        --rgw6ezs: transparent;
        --rgw6ezt: none;
        --rgw6ezu: #fff;
        --rgw6ezv: #4c82fb;
        --rgw6ezw: rgba(173, 188, 255, 0.18823529411764706);
        --rgw6ezx: #fb118e;
        --rgw6ezy: #530f10;
        --rgw6ezz: #fa2c38;
        --rgw6ez10: #fd766b;
        --rgw6ez11: #eeb317;
        --rgw6ez12: #b17900;
        --rgw6ez13: #5cfe9d;
        --rgw6ez14: #1a9550;
        --rgw6ez15: #bdb8fa;
        --rgw6ez16: #7a7beb;
        --rgw6ez17: #0e111a;
        --rgw6ez18: #141b2b;
        --rgw6ez19: #293249;
        --rgw6ez1a: #5e6887;
        --rgw6ez1b: #7c85a2;
        --rgw6ez1c: #99a1bd;
        --rgw6ez1d: #b7bed4;
        --rgw6ez1e: #dde3f7;
        --rgw6ez1f: #edeff7;
        --rgw6ez1g: hsla(0, 0%, 100%, 0.12);
        --rgw6ez1h: rgba(153, 161, 189, 0.24);
        --rgw6ez1i: rgba(153, 161, 189, 0.0784313725490196);
        --rgw6ez1j: rgba(76, 130, 251, 0.23921568627450981);
        --rgw6ez1k: 1.5px solid rgba(0, 0, 0, 0.1);
        --rgw6ez1l: none;
        --rgw6ez1m: 0px;
        --rgw6ez1n: 4px;
        --rgw6ez1o: 8px;
        --rgw6ez1p: 10px;
        --rgw6ez1q: 12px;
        --rgw6ez1r: 14px;
        --rgw6ez1s: 16px;
        --rgw6ez1t: 20px;
        --rgw6ez1u: 30px;
        --rgw6ez1v: 40px;
        --rgw6ez1w: 100px;
        --rgw6ez1x: 16px;
        --rgw6ez1y: 24px;
        --rgw6ez1z: 9999px;
        --rgw6ez20: 0;
        --rgw6ez21: 10px;
        --rgw6ez22: 12px;
        --rgw6ez23: 14px;
        --rgw6ez24: 16px;
        --rgw6ez25: 20px;
        --rgw6ez26: 24px;
        --rgw6ez27: 28px;
        --rgw6ez28: 34px;
        --rgw6ez29: 36px;
        --rgw6ez2a: 40px;
        --rgw6ez2b: 48px;
        --rgw6ez2c: 60px;
        --rgw6ez2d: 96px;
        --rgw6ez2e: 1px;
        --rgw6ez2f: 12px;
        --rgw6ez2g: 14px;
        --rgw6ez2h: 16px;
        --rgw6ez2i: 20px;
        --rgw6ez2j: 24px;
        --rgw6ez2k: 28px;
        --rgw6ez2l: 36px;
        --rgw6ez2m: 44px;
        --rgw6ez2n: auto;
        --rgw6ez2o: 400;
        --rgw6ez2p: 500;
        --rgw6ez2q: 600;
        --rgw6ez2r: 700;
        --rgw6ez2s: 900;
        --rgw6ez2t: 125ms;
        --rgw6ez2u: 250ms;
        --rgw6ez2v: 500ms;
        --rgw6ez2w: Inter, sans-serif;
        --rgw6ez2x: Adieu, sans-serif;
    }
    .rgw6ezam {
        font-size: 16px;
        font-size: var(--rgw6ez24);
    }
    .rgw6ezas {
        font-size: 20px;
        font-size: var(--rgw6ez25);
    }
    .rgw6ezca {
        font-weight: 400;
        font-weight: var(--rgw6ez2o);
    }
    .rgw6ezcm {
        font-weight: 600;
        font-weight: var(--rgw6ez2q);
    }
    .rgw6ezim {
        margin-left: 0;
    }
    .rgw6ezo4 {
        margin-right: 0;
    }
    .rgw6eztm {
        margin-top: 0;
    }
    .rgw6ez14g {
        width: 100%;
    }
    .rgw6ez1ay {
        height: 100%;
    }
    .rgw6ez1vg {
        max-height: inherit;
    }
    .rgw6ez22s {
        padding-bottom: 6px;
    }
    .rgw6ez22y {
        padding-bottom: 8px;
    }
    .rgw6ez23a {
        padding-bottom: 12px;
    }
    .rgw6ez27m {
        padding-left: 0;
    }
    .rgw6ez28s {
        padding-left: 12px;
    }
    .rgw6ez2d4 {
        padding-right: 0;
    }
    .rgw6ez2ea {
        padding-right: 12px;
    }
    .rgw6ez2im {
        padding-top: 0;
    }
    .rgw6ez2ja {
        padding-top: 6px;
    }
    .rgw6ez2js {
        padding-top: 12px;
    }
    .rgw6ez2kg {
        padding-top: 20px;
    }
    .rgw6ez2pa {
        padding: 12px;
    }
    .rgw6ez2z4 {
        left: 0;
    }
    .rgw6ez39y {
        right: unset;
    }
    .rgw6ez3a4 {
        top: 0;
    }
    .rgw6ez3fm {
        margin: 0;
    }
    .rgw6ez3la {
        z-index: 2;
    }
    .rgw6ez3lg {
        z-index: 3;
    }
    .rgw6ez3z4 {
        display: none;
    }
    .rgw6ez3zg {
        display: flex;
    }
    .rgw6ez41s {
        flex-direction: column;
    }
    .rgw6ez424 {
        justify-content: flex-start;
    }
    .rgw6ez43g {
        position: fixed;
    }
    .rgw6ez43m {
        position: relative;
    }
    .rgw6ez46m {
        color: var(--genie-colors-explicitWhite);
        color: var(--rgw6ez4);
    }
    .rgw6ez4qg {
        border-color: var(--rgw6ezb);
    }
    .rgw6ez5im {
        background-color: var(--genie-colors-backgroundSurface);
        background-color: var(--rgw6ezc);
    }
    .rgw6ez5ks {
        background-color: #4c82fb;
        background-color: var(--rgw6ezp);
    }
    .rgw6ez692 {
        border-style: solid;
    }
    .rgw6ez69u {
        border-radius: 12px;
        border-radius: var(--rgw6ez1q);
    }
    .rgw6ez6a6 {
        border-radius: 20px;
        border-radius: var(--rgw6ez1t);
    }
    .rgw6ez6i2 {
        border-width: 1px;
    }
    .rgw6ez6jy {
        overflow-x: hidden;
    }
    .rgw6ez6ky {
        overflow-y: auto;
    }
    .rgw6ez6lb:hover {
        box-shadow: var(--genie-shadows-elevation);
    }
    .rgw6ez6ma {
        line-height: 20px;
        line-height: var(--rgw6ez2i);
    }
    .rgw6ez6mi {
        line-height: 28px;
        line-height: var(--rgw6ez2k);
    }
    .rgw6ez6n2 {
        transition: 0.25s;
        transition: var(--rgw6ez2u);
    }
    @media screen and (min-width: 640px) {
        .rgw6ezpz {
            margin-right: 20px;
        }
        .rgw6ezu5 {
            margin-top: 4px;
        }
        .rgw6ez13t {
            width: 288px;
        }
        .rgw6ez15b {
            width: auto;
        }
        .rgw6ez1bt {
            height: auto;
        }
        .rgw6ez34h {
            left: unset;
        }
        .rgw6ez34n {
            right: 0;
        }
        .rgw6ez3fh {
            top: unset;
        }
        .rgw6ez3lb {
            z-index: 2;
        }
    }
    ._1klryar0 {
        box-sizing: border-box;
        vertical-align: initial;
        -webkit-tap-highlight-color: transparent;
    }
    ._127l8hdg {
        border: none;
    }
    ._127l8hdg:hover {
        cursor: pointer;
    }
    ._127l8hdg:disabled {
        cursor: auto;
    }
    ._127l8hdi {
        padding: 14px 18px;
    }
    ._127l8hdi:disabled {
        opacity: 0.3;
    }
    .jPfvcU {
        text-decoration: none;
        cursor: pointer;
        transition-duration: 125ms;
        color: rgb(76, 130, 251);
        stroke: rgb(76, 130, 251);
        font-weight: 500;
    }
    .jPfvcU:hover {
        opacity: 0.6;
    }
    .jPfvcU:active {
        opacity: 0.4;
    }
    .dVAOBx {
        text-decoration: none;
        cursor: pointer;
        transition-duration: 125ms;
        color: rgb(76, 130, 251);
        stroke: rgb(76, 130, 251);
        font-weight: 500;
    }
    .dVAOBx:hover {
        opacity: 0.6;
    }
    .dVAOBx:active {
        opacity: 0.4;
    }
    @media (max-width: 720px) {
        .ilzBgG {
            display: none;
        }
    }
    .htCzKB {
        color: rgb(255, 255, 255);
    }
    .hinUJE {
        display: grid;
        grid-auto-rows: auto;
        row-gap: 20px;
    }
    .jgeUFu {
        display: grid;
        grid-auto-rows: auto;
        row-gap: 8px;
    }
    .hJYFVB {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
    }
    .lfsInV {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        appearance: none;
        display: inline-block;
        text-align: center;
        line-height: inherit;
        text-decoration: none;
        font-size: inherit;
        padding: 8px 16px;
        color: white;
        border: 0px;
        border-radius: 4px;
    }
    .gBBPoP {
        width: 100%;
        display: flex;
        padding: 0px;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: start;
        justify-content: flex-start;
    }
    .frnZMK {
        -webkit-box-pack: justify;
        justify-content: space-between;
    }
    .kHFzEX {
        flex-wrap: wrap;
    }
    .leSroW {
        width: fit-content;
    }
    .ffWXsK {
        padding: 16px;
        width: 100%;
        font-weight: 500;
        text-align: center;
        border-radius: 20px;
        outline: none;
        border: 1px solid transparent;
        color: rgb(255, 255, 255);
        text-decoration: none;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        flex-wrap: nowrap;
        -webkit-box-align: center;
        align-items: center;
        cursor: pointer;
        position: relative;
        z-index: 1;
        will-change: transform;
        transition: transform 450ms ease 0s;
        transform: perspective(1px) translateZ(0px);
    }
    .ffWXsK:disabled {
        opacity: 0.5;
        cursor: auto;
        pointer-events: none;
    }
    .ffWXsK > * {
        user-select: none;
    }
    .deMEgA {
        background-color: rgb(33, 114, 229);
        color: white;
    }
    .deMEgA:focus {
        box-shadow: rgb(25, 102, 212) 0px 0px 0px 1pt;
        background-color: rgb(25, 102, 212);
    }
    .deMEgA:hover {
        background-color: rgb(25, 102, 212);
    }
    .deMEgA:active {
        box-shadow: rgb(22, 91, 189) 0px 0px 0px 1pt;
        background-color: rgb(22, 91, 189);
    }
    .deMEgA:disabled {
        background-color: rgb(44, 47, 54);
        color: rgb(195, 197, 203);
        cursor: auto;
        box-shadow: none;
        border: 1px solid transparent;
        outline: none;
    }
    .cvxPtY {
        background-color: rgb(33, 36, 41);
        color: rgb(195, 197, 203);
        font-size: 16px;
        font-weight: 500;
    }
    .cvxPtY:hover {
        background-color: rgb(33, 35, 40);
    }
    .cvxPtY:active {
        background-color: rgb(21, 23, 26);
    }
    .hYTqPD {
        border: 1px solid rgba(55, 107, 173, 0.44);
        color: rgb(33, 114, 229);
        background-color: transparent;
        font-size: 16px;
        border-radius: 12px;
        padding: 10px;
    }
    .hYTqPD:focus {
        box-shadow: rgba(55, 107, 173, 0.44) 0px 0px 0px 1pt;
        border: 1px solid rgb(77, 143, 234);
    }
    .hYTqPD:hover {
        border: 1px solid rgb(77, 143, 234);
    }
    .hYTqPD:active {
        box-shadow: rgba(55, 107, 173, 0.44) 0px 0px 0px 1pt;
        border: 1px solid rgb(77, 143, 234);
    }
    .hYTqPD:disabled {
        opacity: 0.5;
        cursor: auto;
    }
    .cTLUfZ path {
        stroke: rgb(255, 255, 255);
    }
    .iveUAE {
        width: 100%;
        margin: 0px;
        height: 40px;
        background-color: rgb(25, 27, 31);
        border: 1px solid rgb(25, 27, 31);
        padding: 0.15rem 0.5rem;
        border-radius: 16px;
    }
    .iveUAE:hover,
    .iveUAE:focus {
        cursor: pointer;
        outline: none;
        border: 1px solid rgb(64, 68, 79);
    }
    .iveUAE svg {
        margin-top: 2px;
    }
    .YWqOk {
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        position: relative;
        border: none;
        text-align: left;
    }
    .bxuolP {
        z-index: 1070;
        visibility: hidden;
        opacity: 0;
        transition: visibility 150ms linear 0s, opacity 150ms linear 0s;
        color: rgb(195, 197, 203);
    }
    .cSretk {
        display: inline-block;
        height: inherit;
    }
    .jnYUnI {
        width: 8px;
        height: 8px;
        z-index: 9998;
    }
    .jnYUnI::before {
        position: absolute;
        width: 8px;
        height: 8px;
        box-sizing: border-box;
        z-index: 9998;
        content: "";
        border: 1px solid rgb(44, 47, 54);
        transform: rotate(45deg);
        background: rgb(25, 27, 31);
    }
    .jnYUnI.arrow-right {
        left: -4px;
    }
    .jnYUnI.arrow-right::before {
        border-right: none;
        border-top: none;
    }
    .fSthCY {
        max-width: 256px;
        padding: 0.6rem 1rem;
        font-weight: 400;
        word-break: break-word;
        background: rgb(25, 27, 31);
        border-radius: 12px;
        border: 1px solid rgb(44, 47, 54);
        box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 8px 0px;
    }
    .bDmHPU {
        padding: 0px 8px;
        max-width: 480px;
        width: 100%;
    }
    @media only screen and (max-width: 768px) {
        .bDmHPU {
            padding-top: 0px;
        }
    }
    @media only screen and (max-width: 640px) {
        .bDmHPU {
            padding-top: 0px;
        }
    }
    .bAkuEV {
        position: relative;
        background: rgb(25, 27, 31);
        border-radius: 24px;
        border: 1px solid transparent;
        padding: 8px;
        z-index: 1;
        box-shadow: rgba(0, 0, 0, 0.01) 0px 0px 1px, rgba(0, 0, 0, 0.04) 0px 4px 8px,
            rgba(0, 0, 0, 0.04) 0px 16px 24px, rgba(0, 0, 0, 0.01) 0px 24px 32px;
    }
    .eSeQEv {
        border-radius: 12px;
        height: 32px;
        width: 32px;
        position: relative;
        margin: -14px auto;
        background-color: rgb(33, 36, 41);
        border: 4px solid rgb(25, 27, 31);
        z-index: 2;
    }
    .eSeQEv:hover {
        cursor: pointer;
        opacity: 0.8;
    }
    .fyqfbY {
        height: 16px;
        width: 16px;
        border-radius: 1.125rem;
        background-color: rgb(86, 90, 105);
        font-size: initial;
    }
    .hVuOEJ {
        position: relative;
        display: flex;
        flex-flow: column nowrap;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        margin-right: 8px;
    }
    .hVuOEJ span {
        height: 16px;
        width: 16px;
    }
    @media (max-width: 960px) {
        .hVuOEJ {
            align-items: flex-end;
        }
    }
    .iTKKBi {
        width: 24px;
        height: 24px;
        background: radial-gradient(
            white 50%,
            rgba(255, 255, 255, 0) calc(75% + 1px),
            rgba(255, 255, 255, 0) 100%
        );
        border-radius: 50%;
        box-shadow: black 0px 0px 1px;
        border: 0px solid rgba(255, 255, 255, 0);
    }
    .dXNPyx {
        box-shadow: white 0px 0px 1px;
    }
    .jarGGn {
        width: 24px;
        height: 24px;
        margin-right: 16px;
    }
    .jNycYy {
        color: rgb(130, 71, 229);
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: start;
        justify-content: flex-start;
        margin: 8px;
        font-size: 14px;
    }
    .gbCBEO {
        position: relative;
        margin-top: 16px;
    }
    .ehGdFL {
        background: radial-gradient(
            100% 93.36% at 0% 6.64%,
            rgba(160, 108, 247, 0.1) 0%,
            rgba(82, 32, 166, 0.1) 100%
        );
        border-radius: 20px;
        display: flex;
        flex-direction: row;
        overflow: hidden;
        position: relative;
        width: 100%;
    }
    .ehGdFL::before {
        background-image: url(https://app.uniswap.org/static/media/polygon-matic-logo.97ff139c.svg);
        background-repeat: no-repeat;
        background-size: 300px;
        content: "";
        height: 300px;
        opacity: 0.1;
        position: absolute;
        transform: rotate(25deg) translate(-90px, -40px);
        width: 300px;
        z-index: -1;
    }
    .hVaGkx {
        font-weight: 600;
        font-size: 16px;
        margin: 0px;
    }
    .dxWPUJ {
        -webkit-box-align: center;
        align-items: center;
        border-radius: 8px;
        color: white;
        display: flex;
        font-size: 16px;
        -webkit-box-pack: justify;
        justify-content: space-between;
        padding: 6px 8px;
        margin-right: 12px;
        width: 100%;
        text-decoration: none !important;
    }
    .RMvMn {
        margin-left: 12px;
        width: 24px;
        height: 24px;
    }
    .eaouLI {
        filter: none;
        opacity: 1;
        transition: opacity 0.2s ease-in-out 0s;
    }
    .hrUmAB {
        color: rgb(255, 255, 255);
        width: 0px;
        position: relative;
        font-weight: 500;
        outline: none;
        border: none;
        flex: 1 1 auto;
        background-color: rgb(33, 36, 41);
        font-size: 28px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        padding: 0px;
        appearance: textfield;
        text-align: right;
    }
    .hrUmAB::-webkit-input-placeholder {
        color: rgb(178, 185, 210);
    }
    .hrUmAB::placeholder {
        color: rgb(178, 185, 210);
    }
    .hTfAkf {
        display: flex;
        flex-flow: column nowrap;
        position: relative;
        border-radius: 20px;
        background-color: rgb(44, 47, 54);
        z-index: 1;
        width: initial;
        transition: height 1s ease 0s;
        will-change: height;
    }
    .gbCyiT {
        border-radius: 20px;
        border: 1px solid rgb(25, 27, 31);
        background-color: rgb(33, 36, 41);
        width: initial;
    }
    .gbCyiT:focus,
    .gbCyiT:hover {
        border: 1px solid rgb(64, 68, 79);
    }
    .usljI {
        -webkit-box-align: center;
        align-items: center;
        background-color: rgb(44, 47, 54);
        opacity: 1;
        box-shadow: none;
        color: rgb(255, 255, 255);
        cursor: pointer;
        height: 2.4rem;
        border-radius: 16px;
        outline: none;
        user-select: none;
        border: none;
        font-size: 24px;
        font-weight: 400;
        width: initial;
        padding: 0px 8px;
        gap: 0px;
        -webkit-box-pack: justify;
        justify-content: space-between;
        margin-left: 12px;
        visibility: visible;
    }
    .usljI:hover {
        background-color: rgb(64, 68, 79);
    }
    .usljI:active {
        background-color: rgb(64, 68, 79);
    }
    .cFhJnE {
        -webkit-box-align: center;
        align-items: center;
        background-color: rgb(33, 114, 229);
        opacity: 1;
        box-shadow: rgba(0, 0, 0, 0.075) 0px 6px 10px;
        color: rgb(255, 255, 255);
        cursor: pointer;
        height: 2.4rem;
        border-radius: 16px;
        outline: none;
        user-select: none;
        border: none;
        font-size: 24px;
        font-weight: 400;
        width: initial;
        padding: 0px 8px;
        gap: 0px;
        -webkit-box-pack: justify;
        justify-content: space-between;
        margin-left: 12px;
        visibility: visible;
    }
    .cFhJnE:hover {
        background-color: rgb(25, 102, 212);
    }
    .cFhJnE:active {
        background-color: rgb(25, 102, 212);
    }
    .gURECW {
        display: flex;
        flex-flow: row nowrap;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        justify-content: space-between;
        padding: 1rem;
    }
    .fwbact {
        display: flex;
        flex-flow: row nowrap;
        -webkit-box-align: center;
        align-items: center;
        color: rgb(255, 255, 255);
        font-size: 0.75rem;
        line-height: 1rem;
        padding: 0px 1rem 1rem;
    }
    .gzdHPL {
        -webkit-box-pack: end;
        justify-content: flex-end;
        height: 24px;
    }
    .dBwdwc {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: justify;
        justify-content: space-between;
        width: 100%;
    }
    .fmoquy {
        margin: 0px 0.25rem 0px 0.35rem;
        height: 35%;
    }
    .fmoquy path {
        stroke: rgb(255, 255, 255);
        stroke-width: 1.5px;
    }
    .cDshyY {
        margin: 0px 0.25rem;
        font-size: 18px;
        font-weight: 500;
    }
    .fBFHRe {
        filter: none;
        opacity: 1;
        transition: opacity 0.2s ease-in-out 0s;
        text-align: left;
    }
    .lbfZs {
        height: 20px;
        width: 20px;
    }
    .lbfZs > * {
        stroke: rgb(255, 255, 255);
    }
    .iDWMMh {
        position: relative;
        width: 100%;
        border: none;
        background-color: transparent;
        margin: 0px;
        padding: 0px;
        border-radius: 0.5rem;
        height: 20px;
    }
    .iDWMMh:hover,
    .iDWMMh:focus {
        cursor: pointer;
        outline: none;
        opacity: 0.7;
    }
    .jMMxfi {
        margin-left: 0.5rem;
        display: flex;
        -webkit-box-pack: center;
        justify-content: center;
        -webkit-box-align: center;
        align-items: center;
        position: relative;
        border: none;
        text-align: left;
    }
    .cYRbzL {
        padding: 8px 12px;
        margin-bottom: 8px;
        width: 100%;
        color: rgb(195, 197, 203);
    }
    .faTeWD {
        opacity: 0.6;
        margin-top: 1rem !important;
    }
    .faTeWD:hover {
        opacity: 1;
    }
    .hbdxeO {
        display: inline-flex;
        -webkit-box-align: center;
        align-items: center;
        -webkit-box-pack: center;
        justify-content: center;
        width: 100%;
        height: 100%;
    }
    .cRzsB {
        position: relative;
    }
    .ihvkLg {
        display: flex;
        flex-flow: row nowrap;
        width: 100%;
        -webkit-box-align: center;
        align-items: center;
        padding: 0.5rem;
        border-radius: 9999px;
        cursor: pointer;
        user-select: none;
        height: 36px;
        margin-right: 2px;
        margin-left: 2px;
    }
    .ihvkLg:focus {
        outline: none;
    }
    .jnTWTk {
        background-color: rgb(33, 36, 41);
        border: 1px solid rgb(33, 36, 41);
        color: rgb(255, 255, 255);
        font-weight: 500;
    }
    .jnTWTk:hover,
    .jnTWTk:focus {
        border: 1px solid rgb(53, 56, 65);
    }
    .jnTWTk:hover:focus,
    .jnTWTk:focus:focus {
        border: 1px solid rgb(21, 23, 26);
    }
    .ldiIWn {
        flex: 1 1 auto;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        margin: 0px 0.5rem 0px 0.25rem;
        font-size: 1rem;
        width: fit-content;
        font-weight: 500;
    }
    .dxNFXs {
        height: 20px;
        width: 20px;
        margin-right: 8px;
    }
    .hytLrO {
        flex: 1 1 auto;
    }
    .hivUOx {
        display: none;
    }
    @media screen and (min-width: 720px) {
        .hivUOx {
            display: block;
            margin-right: 8px;
        }
    }
    .jeYMQh {
        -webkit-box-align: center;
        align-items: center;
        background-color: rgb(25, 27, 31);
        border: 2px solid rgb(25, 27, 31);
        border-radius: 16px;
        color: rgb(255, 255, 255);
        display: flex;
        font-weight: 500;
        -webkit-box-pack: justify;
        justify-content: space-between;
        padding: 6px 8px;
        cursor: default;
    }
    .jeYMQh:focus {
        background-color: rgb(255, 16, 16);
    }
    @media screen and (min-width: 720px) {
        .ekjeVf {
            margin-right: 8px;
        }
    }
    @media screen and (min-width: 720px) {
        .cMNjRs {
            position: relative;
        }
    }
    .lfEMTx {
        width: 16px;
    }
    .cDPxHR {
        display: grid;
        grid-template-columns: 120px 1fr 120px;
        -webkit-box-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        align-items: center;
        flex-direction: row;
        width: 100%;
        top: 0px;
        padding: 1rem;
        z-index: 21;
        position: relative;
        background-image: linear-gradient(transparent 50%, rgb(25, 27, 31) 50%);
        background-position: 0px 0px;
        background-size: 100% 200%;
        box-shadow: transparent 0px 0px 0px 1px;
        transition: background-position 0.1s ease 0s, box-shadow 0.1s ease 0s;
        background-blend-mode: hard-light;
    }
    @media (max-width: 1280px) {
        .cDPxHR {
            grid-template-columns: 48px 1fr 1fr;
        }
    }
    @media (max-width: 960px) {
        .cDPxHR {
            padding: 1rem;
            grid-template-columns: 1fr 1fr;
        }
    }
    @media (max-width: 720px) {
        .cDPxHR {
            padding: 1rem;
            grid-template-columns: 36px 1fr;
        }
    }
    .byWPhu {
        display: flex;
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
        justify-self: flex-end;
    }
    .laabeG {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
    }
    .laabeG:not(:first-child) {
        margin-left: 0.5em;
    }
    @media (max-width: 960px) {
        .laabeG {
            -webkit-box-align: center;
            align-items: center;
        }
    }
    .gkNDVh {
        justify-self: center;
        background-color: rgb(25, 27, 31);
        width: max-content;
        padding: 2px;
        border-radius: 16px;
        display: grid;
        grid-auto-flow: column;
        gap: 10px;
        overflow: auto;
        -webkit-box-align: center;
        align-items: center;
    }
    @media (max-width: 1280px) {
        .gkNDVh {
            justify-self: start;
        }
    }
    @media (max-width: 960px) {
        .gkNDVh {
            justify-self: center;
        }
    }
    @media (max-width: 960px) {
        .gkNDVh {
            flex-direction: row;
            -webkit-box-pack: justify;
            justify-content: space-between;
            justify-self: center;
            z-index: 99;
            position: fixed;
            bottom: 0px;
            right: 50%;
            transform: translate(50%, -50%);
            margin: 0px auto;
            background-color: rgb(25, 27, 31);
            border: 1px solid rgb(44, 47, 54);
            box-shadow: rgba(0, 0, 0, 0.02) 0px 6px 10px;
        }
    }
    .eKAXzW {
        display: flex;
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
        background-color: rgb(25, 27, 31);
        border-radius: 16px;
        white-space: nowrap;
        width: 100%;
        height: 40px;
    }
    .eKAXzW:focus {
        border: 1px solid blue;
    }
    @media (max-width: 500px) {
        .bYIEGZ {
            display: none;
        }
    }
    .gJaIbL {
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        pointer-events: auto;
        justify-self: flex-start;
        margin-right: 12px;
    }
    @media (max-width: 720px) {
        .gJaIbL {
            justify-self: center;
        }
    }
    .gJaIbL:hover {
        cursor: pointer;
    }
    .hzptBO {
        transition: transform 0.3s ease 0s;
        position: relative;
    }
    .hzptBO:hover {
        transform: rotate(-5deg);
    }
    .gfRsre {
        display: flex;
        flex-flow: row nowrap;
        border-radius: 3rem;
        outline: none;
        cursor: pointer;
        text-decoration: none;
        color: rgb(195, 197, 203);
        font-size: 1rem;
        font-weight: 500;
        padding: 8px 12px;
        word-break: break-word;
        overflow: hidden;
        white-space: nowrap;
    }
    .gfRsre.active {
        border-radius: 14px;
        font-weight: 600;
        -webkit-box-pack: center;
        justify-content: center;
        color: rgb(255, 255, 255);
        background-color: rgb(33, 36, 41);
    }
    .gfRsre:hover,
    .gfRsre:focus {
        color: rgb(230, 230, 230);
    }
    .kskfLb {
        display: flex;
        flex-flow: row nowrap;
        border-radius: 3rem;
        outline: none;
        cursor: pointer;
        text-decoration: none;
        color: rgb(195, 197, 203);
        font-size: 1rem;
        width: fit-content;
        margin: 0px 12px;
        font-weight: 500;
    }
    .kskfLb:hover,
    .kskfLb:focus {
        color: rgb(230, 230, 230);
        text-decoration: none;
    }
    .dNrztM {
        position: fixed;
        display: flex;
        -webkit-box-align: center;
        align-items: center;
        right: 0px;
        bottom: 0px;
        padding: 1rem;
        color: rgb(39, 174, 96);
        transition: color 250ms ease 0s;
    }
    @media (max-width: 960px) {
        .dNrztM {
            display: none;
        }
    }
    .dCKcsh {
        transition: opacity 0.25s ease 0s;
        opacity: 0.5;
    }
    .dCKcsh:hover {
        opacity: 1;
    }
    .dCKcsh a {
        color: unset;
    }
    .dCKcsh a:hover {
        text-decoration: none;
        color: unset;
    }
    .bfesFx {
        width: 8px;
        height: 8px;
        min-height: 8px;
        min-width: 8px;
        border-radius: 50%;
        position: relative;
        background-color: rgb(39, 174, 96);
        transition: background-color 250ms ease 0s;
    }
    .bqnskO {
        position: relative;
        max-width: 100%;
        height: 0px;
        margin: 0px;
        display: none;
    }
    @media (max-width: 720px) {
        .bqnskO {
            display: block;
            padding-top: 20px;
        }
    }
    .gLdiTM {
        height: 99%;
        overflow: auto hidden;
        display: flex;
        flex-direction: row;
    }
    .gLdiTM::-webkit-scrollbar {
        display: none;
    }
    .leVPqs {
        position: fixed;
        top: 72px;
        right: 1rem;
        width: 100%;
        z-index: 3;
        max-width: 355px !important;
    }
    @media (max-width: 720px) {
        .leVPqs {
            display: none;
        }
    }
    @media screen and (min-width: 961px) and (max-width: 1460px) {
        .leVPqs {
            top: 72px;
        }
    }
    .gEuJQl {
        display: flex;
        flex-flow: column;
        align-items: flex-start;
        font-feature-settings: "ss01", "ss02", "cv01", "cv03";
    }
    .cppDvG {
        display: flex;
        flex-direction: column;
        width: 100%;
        padding: 120px 0px 0px;
        -webkit-box-align: center;
        align-items: center;
        flex: 1 1 0%;
    }
    @media (max-width: 720px) {
        .cppDvG {
            padding: 52px 0px 16px;
        }
    }
    .fjHwBb {
        display: flex;
        flex-flow: row nowrap;
        width: 100%;
        -webkit-box-pack: justify;
        justify-content: space-between;
        position: fixed;
        top: 0px;
        z-index: 1020;
    }
    .fGBDxo {
        margin-top: 5rem;
    }
    html {
        color: rgb(255, 255, 255);
        background-color: rgb(33, 36, 41) !important;
    }
    a {
        color: rgb(33, 114, 229);
    }
    :root {
        --genie-colors-accentFailure: var(--rgw6ez10);
        --genie-colors-accentFailureSoft: rgba(253, 118, 107, 0.12);
        --genie-colors-accentAction: var(--rgw6ezv);
        --genie-colors-accentActionSoft: #000000e5;
        --genie-colors-explicitWhite: #ffffff;
        --genie-colors-green: var(--rgw6ez13);
        --genie-colors-gold: var(--rgw6ez11);
        --genie-colors-violet: var(--rgw6ez15);
        --genie-colors-backgroundFloating: 0C;
        --genie-colors-backgroundInteractive: var(--rgw6ez19);
        --genie-colors-backgroundModule: var(--rgw6ez18);
        --genie-colors-backgroundOutline: rgba(153, 161, 189, 0.24);
        --genie-colors-backgroundSurface: var(--rgw6ez17);
        --genie-colors-modalBackdrop: linear-gradient(0deg, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7));
        --genie-colors-stateOverlayHover: rgba(153, 161, 189, 0.08);
        --genie-colors-textPrimary: #ffffff;
        --genie-colors-textSecondary: var(--rgw6ez1c);
        --genie-colors-textTertiary: var(--rgw6ez1a);
        --genie-shadows-menu: 0px 10px 30px rgba(0, 0, 0, 0.1);
        --genie-shadows-genieBlue: 0 4px 16px 0 rgba(70, 115, 250, 0.4);
        --genie-shadows-elevation: 0px 4px 16px rgba(70, 115, 250, 0.4);
        --genie-shadows-tooltip: 0px 4px 16px rgba(255, 255, 255, 0.2);
        --genie-shadows-deep: 12px 16px 24px rgba(0, 0, 0, 0.24), 12px 8px 12px rgba(0, 0, 0, 0.24),
            4px 4px 8px rgba(0, 0, 0, 0.32);
    }
    .css-x9zcw6 {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        font-weight: 500;
        font-size: 11px;
    }
    .css-dz8bsg {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        font-weight: 500;
        font-size: 16px;
    }
    .css-1io72gt {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        font-weight: 400;
        font-size: 14px;
        color: rgb(178, 185, 210);
    }
    .css-d8m55i {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        font-weight: 400;
        font-size: 14px;
        color: rgb(153, 161, 189);
    }
    .css-10ob8xa {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        font-size: 20px;
        font-weight: 500;
    }
    .css-z9m35u {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        padding-left: 0.75rem;
        padding-right: 0.4rem;
        font-weight: 500;
    }
    ._1qffq9m3 {
        scrollbar-width: none;
    }
    ._1qffq9m3::-webkit-scrollbar {
        display: none;
    }
    ._1qffq9m6:hover {
        box-shadow: none;
    }
    @media screen and (max-width: 768px) {
        ._1qffq9m1 {
            border-radius: 0;
        }
    }
    @media screen and (min-width: 768px) {
        ._1qffq9m3 {
            max-height: 55vh;
        }
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 100;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Thin.de9194d1.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Thin.fcc91246.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 100;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ThinItalic.ec0fcc99.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ThinItalic.6b5565d7.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 200;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraLight.21843ac6.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraLight.7b7bd05c.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 200;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraLightItalic.04abe79a.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraLightItalic.a7a00555.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 300;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Light.51f4d175.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Light.c08cfeeb.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 300;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-LightItalic.8942ebe8.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-LightItalic.203b9b31.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 400;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Regular.6cc68d6b.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Regular.8398b376.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 400;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Italic.e2f52803.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Italic.635afeed.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 500;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Medium.ba68c34a.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Medium.f5549f68.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 500;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-MediumItalic.d29ef50a.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-MediumItalic.2812ec5a.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 600;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-SemiBold.625474d6.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-SemiBold.25b1ffc9.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 600;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-SemiBoldItalic.c632fb96.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-SemiBoldItalic.80d799be.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 700;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Bold.a808c21a.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Bold.1c3dfbb0.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 700;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-BoldItalic.97443965.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-BoldItalic.32e2b20f.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 800;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraBold.1ca2a2cf.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraBold.30c3d891.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 800;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraBoldItalic.a0a103e5.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraBoldItalic.cd668286.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 900;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Black.ef2d12b9.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Black.e258f998.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 900;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-BlackItalic.a1ea21b0.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-BlackItalic.70d2cf35.woff) format("woff");
    }

    /* Manual fixes */
    section {
        /* display: flex; */
        flex-direction: column;
        justify-content: center;
        align-items: center;
        flex: 0.6;
    }

    * {
        font-family: Inter, sans-serif;
        box-sizing: border-box;
    }
    #background-radial-gradient {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        pointer-events: none;
        width: 200vw;
        height: 200vh;
        background: radial-gradient(50% 50% at 50% 50%, #fc077d10 0, rgba(255, 255, 255, 0) 100%);
        transform: translate(-50vw, -100vh);
        z-index: -1;
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 100;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Thin.de9194d1.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Thin.fcc91246.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 100;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ThinItalic.ec0fcc99.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ThinItalic.6b5565d7.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 200;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraLight.21843ac6.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraLight.7b7bd05c.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 200;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraLightItalic.04abe79a.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraLightItalic.a7a00555.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 300;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Light.51f4d175.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Light.c08cfeeb.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 300;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-LightItalic.8942ebe8.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-LightItalic.203b9b31.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 400;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Regular.6cc68d6b.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Regular.8398b376.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 400;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Italic.e2f52803.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Italic.635afeed.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 500;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Medium.ba68c34a.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Medium.f5549f68.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 500;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-MediumItalic.d29ef50a.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-MediumItalic.2812ec5a.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 600;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-SemiBold.625474d6.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-SemiBold.25b1ffc9.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 600;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-SemiBoldItalic.c632fb96.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-SemiBoldItalic.80d799be.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 700;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Bold.a808c21a.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Bold.1c3dfbb0.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 700;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-BoldItalic.97443965.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-BoldItalic.32e2b20f.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 800;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraBold.1ca2a2cf.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraBold.30c3d891.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 800;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-ExtraBoldItalic.a0a103e5.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-ExtraBoldItalic.cd668286.woff)
                format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: normal;
        font-weight: 900;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-Black.ef2d12b9.woff2) format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-Black.e258f998.woff) format("woff");
    }
    @font-face {
        font-family: "Inter";
        font-style: italic;
        font-weight: 900;
        font-display: swap;
        src: url(https://app.uniswap.org/static/media/Inter-BlackItalic.a1ea21b0.woff2)
                format("woff2"),
            url(https://app.uniswap.org/static/media/Inter-BlackItalic.70d2cf35.woff) format("woff");
    }

    .logo-container {
        position: relative;
        top: 1rem;
        cursor: pointer;
        z-index: 9999;
        /* left: 1rem; */
    }

    @media (max-width: 1000px) {
        .card {
            margin-left: auto;
            margin-right: auto;
            width: 100%;
            max-width: 100%;
        }

        .logo-container {
            margin-right: auto;
            margin-left: auto;
            justify-content: center;
            text-align: center;
            display: flex;
            left: initial;
        }
    }
</style>
