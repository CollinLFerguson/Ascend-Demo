<script>
	import { Accordion, MainContent, Button, PageBody, Page, Card, NewNotificationIcon, PageHeader, MetricCard } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon} from '$lib/index'

    export let data;
</script>

<Page styles={["horizontal-padding:5vw", "justify-content:left"]}>
    <div style="display:column; align-items:top; justify-content:left; width:95%">
        <div style=" width:100%; height:8vw;">
            <PageHeader titleText="Staff" titleJustification="left" styles={["border-left: 4px solid #E0E7FF;"]} >
            </PageHeader>
        </div>
        <div style="display:flex; justify-content:left; width:100%; justify-content:space-between; padding-left:5vw; padding-top:45px; min-width:100">
            <!--The Metric Card components do not have classes or else I would just give them a custom class-->
            <MetricCard
            styles={['min-width:120px', 'align-items:center', "max-height:100px", "box-shadow:4px 4px 10px rgba(0, 0, 0, 0.3)"]}
            title="My Staff"
            value="10"
            />
            <MetricCard
            styles={['min-width:120px', 'align-items:center', "max-height:100px", "box-shadow:4px 4px 10px rgba(0, 0, 0, 0.3)"]}
            title="Total Staff"
            value="100"
            />
            <MetricCard
            styles={['min-width:120px', 'align-items:center', "max-height:100px", "box-shadow:4px 4px 10px rgba(0, 0, 0, 0.3)"]}
            title="Archived Staff"
            value="10"
            />
        </div>

    </div>
    <PageBody size="full">
        <div class="borders"> 
            <h1>Welcome {data.user.firstName} {data.user.lastName}!</h1>
        </div>
    </PageBody>
</Page>

<style>
.metric-card {


}


</style>
