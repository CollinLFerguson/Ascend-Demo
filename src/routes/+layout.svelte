<script>
    import './styles.css'
    import { Main, Shell, ToastArea } from "ascend-ui";

    
    // This exists to act as a main router between the auth layout (with no header, no navbar.)
    //and the 'dashboard' layout (header, navbar, etc)

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
</Shell>