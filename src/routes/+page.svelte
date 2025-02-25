<script>
    import{Button, Card, Page, PageBody, SelectorInput} from 'ascend-ui'
    export let data;
    const optionsList = ["Super Admin User","Supervisor User","Home User"]

</script>

<Page>
	<PageBody size="full" styles={["display:flex", "justify-content: center", " align-items: center", "height: 100vh"]}>
        <h1>Auth Page!</h1>
        <Card classes={["card-l"]} styles={["min-height: 60vh", "min-width: 40vw"]}>
        <div style="width:100%"> 
            <SelectorInput
            bind:selectedValue={data.selectedUser}
            defaultOptionValue="0"
            id = "login-selector"
            label="Select Login Type"
            optionList = {optionsList}
            /><br>
            <Button styles={[]} text = "Login" callback={data.submitLogin}></Button>

        </div>
    </Card>
    </PageBody>
</Page>