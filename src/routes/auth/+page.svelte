<script>
    import{Button, Card, LoginCard, LoginPage, Main, Page, PageBody, SelectorInput, Shell} from 'ascend-ui'
    
    export let data

    const optionsList = ["Super Admin User","Supervisor User","Home User"]
    let selectedUser = "Super Admin User"; // Make selectedUser reactive in the component

    function handleLogin() {
    console.log("Attempting login with:", selectedUser);
    data.submitLogin(selectedUser);
  }

</script>

<Shell> 
    <Main>
        <Page styles={["max-height:95vh"]}>
        <div style="height:80vh !important;">
            <LoginPage>
                <!--<PageBody size="full" styles={["display:flex", "justify-content: center", " align-items: center", "height: 100vh"]}>-->
                        <SelectorInput
                        bind:selectedValue={selectedUser}
                        defaultOptionValue="0"
                        id = "login-selector"
                        label="Select Login Type"
                        optionList = {optionsList}
                        /><br>
                        <Button styles={[]} text = "Login" callback={handleLogin}></Button>
                <!--</PageBody>-->
            </LoginPage>
        </div>
        </Page>
    </Main>
</Shell>