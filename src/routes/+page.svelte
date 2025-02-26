<script>
    import{Button, Card, LoginCard, LoginPage, Page, PageBody, SelectorInput} from 'ascend-ui'
    export let data;
    const optionsList = ["Super Admin User","Supervisor User","Home User"]

</script>
<Page styles={["max-height:95vh"]}>
<div style="height:80vh !important;">
    <LoginPage>
        <!--<PageBody size="full" styles={["display:flex", "justify-content: center", " align-items: center", "height: 100vh"]}>-->
                <SelectorInput
                bind:selectedValue={data.selectedUser}
                defaultOptionValue="0"
                id = "login-selector"
                label="Select Login Type"
                optionList = {optionsList}
                /><br>
                <Button styles={[]} text = "Login" callback={data.submitLogin}></Button>
        <!--</PageBody>-->
    </LoginPage>
</div>
</Page>