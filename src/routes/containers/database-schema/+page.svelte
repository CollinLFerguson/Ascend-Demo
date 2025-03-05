<script>
// @ts-nocheck
	import { Accordion, MainContent, Button, PageBody, Page, Card, NewNotificationIcon, PageHeader, MetricCard, FilterAndSortButton, SearchBar, ExportCSVButton, ExportDataButton, TabBar, NextButton, ProfileButton } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon, PreviewStaffTable} from '$lib/client/index'
    import { authenticatedUser } from '$lib/stores/authStore';
    import { get } from 'svelte/store';    
    let currentUser = get(authenticatedUser) 
    
    let tabList=[
        {name:"Database Disgram"},
        {name:"Program Flow"},
    ]

    let currentTab = "Database Disgram"
    let fromSearch = false;

    /**
     * @param {{ detail: string; }} event
     */
    function handleTabSelect(event) { //Handler for the tab selector.
        currentTab = tabList[event.detail.tabIndex].name; // Set the active tab when clicked
    }

</script>

<Page styles={["horizontal-padding:5vw", "justify-content:left"]}>
    <div style="display:flex; flex-direction:column; align-items:top; justify-content:left; width:100%; gap:60px; max-width:80vw"> <!--Whole page-->
        <div style="display:flex; flex-direction:column; align-items:top; justify-content:left; width:95%; gap:20px"> <!--Header Section-->
            <div style="height:8vw; display:flex; justify-content:left;"> <!--header bar components-->
                {#if currentUser.permissions <= 2}
                    <PageHeader titleText="Database Schema" titleJustification="left" styles={["justify-content:left", "width:100%!important"]}>
                    </PageHeader>
                {:else}
                    <PageHeader titleText="Database Schema" titleJustification="left" styles={["justify-content:left", "width:100%!important"]}>
                    </PageHeader>
                {/if}

            </div>
        </div>
        <div> <!--Content Section-->
            <div style="display:flex; gap: 10px; justify-content:left">
                <TabBar bind:currentTab {tabList} on:tabselect={handleTabSelect} />
            </div>
            <div style= "display:flex; flex-direction:column; gap:20px;">
                <hr style="min-width:1200px; background-color:#6F6697;">
                <div style="display:flex; gap: 10px; justify-content:left; overflow-x:auto; min-width:1200px; padding-bottom: 20px">
                    {#if currentTab == "Database Disgram"}
                        <img src="/src/lib/assets/FergusonCollinDatabaseSchema.png" alt="DB SCHEMA"> 
                    {:else if currentTab == "Program Flow"}
                    <img src="/src/lib/assets/SystemFlowDiagram.png" alt="Program Flow"> 
                    {/if}
                </div>
            </div>
        </div>
    </div>
</Page>