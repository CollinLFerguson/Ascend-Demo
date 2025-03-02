<script>
    import { browser } from "$app/environment";
    import { goto } from "$app/navigation";
    import { Main, Shell, ToastArea } from "ascend-ui";
    import { authStore } from "../stores/authStore";
    import { onMount } from "svelte";

    /**
     * @type {{ isAuthenticated: any; token?: null; userID?: null; }}
     */

     let auth;
    authStore.subscribe(value => auth = value);
   
    onMount(() => {
        if (browser) {
            if (auth && !auth.isAuthenticated) {
                goto("/auth");
            } else {
                goto("/containers")
            }
        }else {console.log("No browser")}
    });

</script>

<Shell> 
    <Main>
        <div><h1>Redirecting</h1></div>
    </Main>
</Shell>