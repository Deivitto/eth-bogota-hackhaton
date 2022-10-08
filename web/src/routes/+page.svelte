<script>
    import Counter from "./Counter.svelte"
    import Index from "./Index.svelte"

    import welcome from "$lib/images/svelte-welcome.webp"
    import welcome_fallback from "$lib/images/svelte-welcome.png"
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
</svelte:head>

<section>
    <!-- <h1>
        <span class="welcome">
            <picture>
                <source srcset={welcome} type="image/webp" />
                <img src={welcome_fallback} alt="Welcome" />
            </picture>
        </span>

        to your new<br />SvelteKit app
    </h1>

    <h2>
        try editing <strong>src/routes/+page.svelte</strong>
    </h2> -->

    <Index />
</section>

<style>
    section {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        flex: 0.6;
    }

    h1 {
        width: 100%;
    }

    .welcome {
        display: block;
        position: relative;
        width: 100%;
        height: 0;
        padding: 0 0 calc(100% * 495 / 2048) 0;
    }

    .welcome img {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        display: block;
    }
</style>
