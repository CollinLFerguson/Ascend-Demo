<script>
    import { get } from 'svelte/store';
    import './styles.css'
    import { Main, Shell, ToastArea } from "ascend-ui";
    import { isAuthenticated } from '$lib/stores/authStore';
    import { goto } from '$app/navigation';
    import { browser } from '$app/environment';

    
    // This exists to act as a main router between the auth layout (with no header, no navbar.)
    //and the 'dashboard' layout (header, navbar, etc)
    
    $: if (browser) {
        if (!$isAuthenticated) {
            goto("/auth");
        } else {
            goto("/containers");
        }
    }

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