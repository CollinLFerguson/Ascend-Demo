<script>
    import './styles.css'
    import { browser } from "$app/environment";
    import { goto } from "$app/navigation";
    import { Main, Shell, ToastArea } from "ascend-ui";
    import { authStore } from "../stores/authStore";
    import { onMount } from "svelte";
    
    /**
     * @type {{ isAuthenticated: any; token?: null; userID?: null; }}
     */
    /*
     let auth;
    authStore.subscribe(value => auth = value);
   
    onMount(() => {
        if (browser) {
            if (auth && !auth.isAuthenticated) {
                goto("/auth", { replaceState: true, reload: true });
            } else {
                goto("/containers")
            }
        }else {console.log("No browser")}
    });*/
    
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