<script>
    import Index from "./index.svelte"
</script>

<svelte:head>
    <title>milky_chain.eth</title>
    <meta name="description" content="milky_chain.eth demo app" />
    <!-- this is for the web3modal -->
    <script type="text/javascript" src="https://unpkg.com/web3modal@1.9.0/dist/index.js"></script>
    <script
        type="text/javascript"
        src="https://unpkg.com/@walletconnect/web3-provider@1.2.1/dist/umd/index.min.js"></script>
    <script type="text/javascript" src="/wallet-sdk-bundle.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/web3@latest/dist/web3.min.js"></script>
</svelte:head>

<section>
    <Index />
</section>

<style>
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
</style>
