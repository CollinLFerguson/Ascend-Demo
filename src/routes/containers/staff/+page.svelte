<script>
// @ts-nocheck
	import { Accordion, MainContent, Button, PageBody, Page, Card, NewNotificationIcon, PageHeader, MetricCard, FilterAndSortButton, SearchBar, ExportCSVButton, ExportDataButton, TabBar, NextButton, ProfileButton } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon, PreviewStaffTable} from '$lib/client/index'
    import { authenticatedUser } from '$lib/stores/authStore';
    import { get } from 'svelte/store';
    import AddStaffButton from './components/addStaffButton.svelte';
    
    let searchTerm = "";
    let programs = [];
    let allowedStatus = [];
    let supervisorId;
    let staffList;
    
    let currentUser = get(authenticatedUser) 
    
    let tabList=[
        {name:"My Staff"},
        {name:"All Staff"}
    ]

    let currentTab = "My Staff"
    let fromSearch = false;

    console.log("Authenitcated user", $authenticatedUser)

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
                    <PageHeader titleText="Staff" titleJustification="left" styles={["justify-content:left", "width:100%!important"]} headerButton={AddStaffButton}>
                    </PageHeader>
                {:else}
                    <PageHeader titleText="Staff" titleJustification="left" styles={["justify-content:left", "width:100%!important"]}>
                    </PageHeader>
                {/if}

            </div>
            <div style="display:flex; flex-direction:column;  gap: 20px;">
                <div style="display:flex; justify-content:left; width:100%; justify-content:space-between;  min-width:100; gap:30px; ">
                    <!--The Metric Card components do not have classes or else I would just give them a custom class-->
                    <MetricCard
                    styles={['min-width:120px', 'align-items:center', "max-height:100px", "box-shadow:4px 4px 10px rgba(0, 0, 0, 0.3)", "width:100%"]}
                    title="My Staff"
                    value="10"
                    />
                    <MetricCard
                    styles={['min-width:120px', 'align-items:center', "max-height:100px", "box-shadow:4px 4px 10px rgba(0, 0, 0, 0.3)", "width:100%"]}
                    title="Total Staff"
                    value="100"
                    />
                    <MetricCard
                    styles={['min-width:120px', 'align-items:center', "max-height:100px", "box-shadow:4px 4px 10px rgba(0, 0, 0, 0.3)", "width:100%"]}
                    title="Archived Staff"
                    value="10"
                    />
                </div>
                <div style="display:flex; justify-content:left; width:100%; justify-content:space-between;">
                    <div style="display:flex; gap: 10px; justify-content:left">
                        <FilterAndSortButton></FilterAndSortButton> 
                        <SearchBar styles={["width:150px", "max-height:30"]}> </SearchBar>
                    </div>
                    <div style="display:flex;  justify-content:right;">
                        <ExportCSVButton text="Export Milage"></ExportCSVButton> 
                        <ExportDataButton></ExportDataButton>
                    </div>
                </div>
            </div>
        </div>
        <div> <!--Content Section-->
            <div style="display:flex; gap: 10px; justify-content:left">
                <TabBar bind:currentTab {tabList} on:tabselect={handleTabSelect} />
            </div>
            <div style= "display:flex; flex-direction:column; gap:20px;">
                <hr style="min-width:1200px; background-color:#6F6697;">
                <div style="display:flex; gap: 10px; justify-content:left; overflow-x:auto; min-width:1200px; padding-bottom: 20px">
                    {#if currentTab == "My Staff"}
                        <PreviewStaffTable fromSearch={fromSearch} showNothing={false} supervisorId={currentUser?.dbkey}></PreviewStaffTable> <!-- Add callback for fetching staff associated with this user -->
                    {:else}
                        <PreviewStaffTable fromSearch={fromSearch} showNothing={false}></PreviewStaffTable> <!-- Add callback for fetching all staff -->
                    {/if}
                </div>
            </div>
        </div>
    </div>
</Page>