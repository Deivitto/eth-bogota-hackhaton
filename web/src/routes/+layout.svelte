<script>
    import "../app.postcss"
    import "./styles.css"

    import { onMount, beforeUpdate, afterUpdate } from "svelte"
    import { init, loadContracts } from "$lib/web3"
    import { signerAddress } from "svelte-ethers-store"

    onMount(() => {
        if (window.location.href.includes("/swap")) window.location.replace("/")
        init()
    })
    // beforeUpdate(() => {
    //     init()
    // })

    // afterUpdate(() => {
    //     init()
    // })
    $: if ($signerAddress) {
        try {
            loadContracts()
        } catch (e) {}
    }
</script>

<div class="app">
    <header />

    <main>
        <slot />
    </main>

    <footer />
</div>

<style>
</style>
