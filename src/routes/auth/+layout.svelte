<script>
    import { Main, Shell, ToastArea } from "ascend-ui";
</script>

<svelte:head>
    <title>Ascend Innovations: Demo</title>
    <link rel="icon" type="image/png" href="/favicon.png"/>
</svelte:head>
<Shell>
    <Main>
        <div>
            <slot />
        </div>
    </Main>
    <ToastArea />
</Shell>