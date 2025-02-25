<script>
	import { Accordion, MainContent, Button, PageBody, Page, Card, NewNotificationIcon } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon} from '$lib/index'

    export let data;

</script>

<Page>
	<PageBody size="full">
        <div class="borders"> 
            <h1>Welcome {data.user.firstName} {data.user.lastName}!</h1>
        </div>
    </PageBody>
</Page>

