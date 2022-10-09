<script>
    import { connected, signerAddress, chainId } from "svelte-ethers-store"
    $: currency = "ETH"
    // let foo
    // console.log(address)
    // console.log(foo)

    // function clicking() {
    //     console.log(address)
    //     console.log(foo)
    // }
</script>

<div class="sc-pradxg-2 laabeG s-ZsLpis4vdNUR ml-1 mr-1">
    <div class="sc-pradxg-4 eKAXzW s-ZsLpis4vdNUR">
        <div
            class="sc-pradxg-7 bYIEGZ css-z9m35u s-ZsLpis4vdNUR"
            style="flex-shrink: 0; user-select: none; color:#fff"
        >
            {currency}
        </div>
        <span class="s-ZsLpis4vdNUR"
            ><button
                data-testid="web3-status-connected"
                class="sc-bczRLJ lfsInV sc-fwrjc2-0 sc-fwrjc2-4 sc-m6ivbz-0 sc-m6ivbz-4 ffWXsK hYTqPD ihvkLg jnTWTk s-ZsLpis4vdNUR"
                ><p class="sc-m6ivbz-5 ldiIWn s-ZsLpis4vdNUR">
                    {#if $signerAddress != null}
                        {$signerAddress.slice(0, 4)}...{$signerAddress.slice(-4)}
                    {:else}
                        Connect
                    {/if}
                </p>
                <div size="16" class="sc-16lz3aa-0 hVuOEJ s-ZsLpis4vdNUR">
                    <div class="sc-z4caw7-0 fyqfbY s-ZsLpis4vdNUR">
                        <span class="s-ZsLpis4vdNUR"
                            ><div
                                class="s-ZsLpis4vdNUR"
                                style="border-radius: 50px; overflow: hidden; padding: 0px; margin: 0px; width: 16px; height: 16px; display: inline-block; background: rgb(250, 58, 0);"
                            >
                                <svg x="0" y="0" width="16" height="16" class="s-ZsLpis4vdNUR"
                                    ><rect
                                        x="0"
                                        y="0"
                                        width="16"
                                        height="16"
                                        transform="translate(2.098874115463103 -0.07934382970125567) rotate(456.5 8 8)"
                                        fill="#C81477"
                                        class="s-ZsLpis4vdNUR"
                                    /><rect
                                        x="0"
                                        y="0"
                                        width="16"
                                        height="16"
                                        transform="translate(-3.214964086684321 -7.956033443566552) rotate(319.5 8 8)"
                                        fill="#F90501"
                                        class="s-ZsLpis4vdNUR"
                                    /><rect
                                        x="0"
                                        y="0"
                                        width="16"
                                        height="16"
                                        transform="translate(4.206701226478874 -14.292925700943588) rotate(358.9 8 8)"
                                        fill="#FB1895"
                                        class="s-ZsLpis4vdNUR"
                                    /></svg
                                >
                            </div></span
                        >
                    </div>
                </div></button
            ></span
        >
    </div>
</div>

<style>
    /*! CSS Used from: Embedded */
    *,
    ::before,
    ::after {
        box-sizing: border-box;
        border-width: 0;
        border-style: solid;
        border-color: #e5e7eb;
    }
    ::before,
    ::after {
        --tw-content: "";
    }
    button {
        font-family: inherit;
        font-size: 100%;
        font-weight: inherit;
        line-height: inherit;
        color: inherit;
        margin: 0;
        padding: 0;
    }
    button {
        text-transform: none;
    }
    button {
        -webkit-appearance: button;
        background-color: transparent;
        background-image: none;
    }
    :-moz-focusring {
        outline: auto;
    }
    p {
        margin: 0;
    }
    button {
        cursor: pointer;
    }
    :disabled {
        cursor: default;
    }
    svg {
        display: block;
        vertical-align: middle;
    }
    *,
    ::before,
    ::after {
        --tw-border-spacing-x: 0;
        --tw-border-spacing-y: 0;
        --tw-translate-x: 0;
        --tw-translate-y: 0;
        --tw-rotate: 0;
        --tw-skew-x: 0;
        --tw-skew-y: 0;
        --tw-scale-x: 1;
        --tw-scale-y: 1;
        --tw-scroll-snap-strictness: proximity;
        --tw-ring-offset-width: 0px;
        --tw-ring-offset-color: #fff;
        --tw-ring-color: rgb(59 130 246 / 0.5);
        --tw-ring-offset-shadow: 0 0 #0000;
        --tw-ring-shadow: 0 0 #0000;
        --tw-shadow: 0 0 #0000;
        --tw-shadow-colored: 0 0 #0000;
    }
    /*! CSS Used from: Embedded */
    .s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        font-family: Inter, sans-serif;
        box-sizing: border-box;
    }
    button.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }
    .lfsInV.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        -webkit-appearance: none;
        -moz-appearance: none;
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
    .ffWXsK.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
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
        justify-content: center;
        flex-wrap: nowrap;
        align-items: center;
        cursor: pointer;
        position: relative;
        z-index: 1;
        will-change: transform;
        transition: transform 450ms ease 0s;
        transform: perspective(1px) translateZ(0px);
    }
    .ffWXsK.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:disabled {
        opacity: 0.5;
        cursor: auto;
        pointer-events: none;
    }
    .ffWXsK.s-ZsLpis4vdNUR > .s-ZsLpis4vdNUR {
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }
    .hYTqPD.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        border: 1px solid rgba(55, 107, 173, 0.44);
        color: rgb(33, 114, 229);
        background-color: transparent;
        font-size: 16px;
        border-radius: 12px;
        padding: 10px;
    }
    .hYTqPD.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:focus {
        box-shadow: rgba(55, 107, 173, 0.44) 0px 0px 0px 1pt;
        border: 1px solid rgb(77, 143, 234);
    }
    .hYTqPD.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:hover {
        border: 1px solid rgb(77, 143, 234);
    }
    .hYTqPD.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:active {
        box-shadow: rgba(55, 107, 173, 0.44) 0px 0px 0px 1pt;
        border: 1px solid rgb(77, 143, 234);
    }
    .hYTqPD.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:disabled {
        opacity: 0.5;
        cursor: auto;
    }
    .fyqfbY.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        height: 16px;
        width: 16px;
        border-radius: 1.125rem;
        background-color: rgb(86, 90, 105);
        font-size: initial;
    }
    .hVuOEJ.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        position: relative;
        display: flex;
        flex-flow: column nowrap;
        align-items: center;
        justify-content: center;
        margin-right: 8px;
    }
    .hVuOEJ.s-ZsLpis4vdNUR span.s-ZsLpis4vdNUR {
        height: 16px;
        width: 16px;
    }
    @media (max-width: 960px) {
        .hVuOEJ.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
            align-items: flex-end;
        }
    }
    .ihvkLg.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        display: flex;
        flex-flow: row nowrap;
        width: 100%;
        align-items: center;
        padding: 0.5rem;
        border-radius: 9999px;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
        height: 36px;
        margin-right: 2px;
        margin-left: 2px;
    }
    .ihvkLg.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:focus {
        outline: none;
    }
    .jnTWTk.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        background-color: rgb(33, 36, 41);
        border: 1px solid rgb(33, 36, 41);
        color: rgb(255, 255, 255);
        font-weight: 500;
    }
    .jnTWTk.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:hover,
    .jnTWTk.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:focus {
        border: 1px solid rgb(53, 56, 65);
    }
    .jnTWTk.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:hover:focus,
    .jnTWTk.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:focus:focus {
        border: 1px solid rgb(21, 23, 26);
    }
    .ldiIWn.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        flex: 1 1 auto;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        margin: 0px 0.5rem 0px 0.25rem;
        font-size: 1rem;
        width: -moz-fit-content;
        width: fit-content;
        font-weight: 500;
    }
    .laabeG.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        display: flex;
        align-items: center;
    }
    .laabeG.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:not(:first-child) {
        margin-left: 0.5em;
    }
    @media (max-width: 960px) {
        .laabeG.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
            align-items: center;
        }
    }
    .eKAXzW.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        display: flex;
        flex-direction: row;
        align-items: center;
        background-color: rgb(25, 27, 31);
        border-radius: 16px;
        white-space: nowrap;
        width: 100%;
        height: 40px;
    }
    .eKAXzW.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR:focus {
        border: 1px solid blue;
    }
    @media (max-width: 500px) {
        .bYIEGZ.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
            display: none;
        }
    }
    .css-z9m35u.s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        box-sizing: border-box;
        margin: 0px;
        min-width: 0px;
        padding-left: 0.75rem;
        padding-right: 0.4rem;
        font-weight: 500;
    }
    .s-ZsLpis4vdNUR.s-ZsLpis4vdNUR {
        font-family: Inter, sans-serif;
        box-sizing: border-box;
    }
    /*! CSS Used fontfaces */
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
</style>
