<script>
	import { Accordion, MainContent, Button, PageBody, Page, Card, NewNotificationIcon, PageHeader, MetricCard, FilterAndSortButton, SearchBar, ExportCSVButton, ExportDataButton, TabBar } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon, PreviewStaffTable} from '$lib/index'

    export let data;
    let tabList=[
        {name:"My Staff"},
        {name:"All Staff"}
    ]

    let currentTab = "My Staff"
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
            <div style="height:8vw; border-left:4px solid #E0E7FF; justify-content:left;"> <!--header bar components-->
                <PageHeader titleText="Staff" titleJustification="left" styles={["justify-content:left"]} >
                </PageHeader>
            </div>
            <div style="display:flex; flex-direction:column;  gap: 20px;">
                <div style="display:flex; justify-content:left; width:100%; justify-content:space-between;  min-width:100; gap:30px">
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
                <hr>
                <div style="display:flex; gap: 10px; justify-content:left">
                    {#if currentTab == "My Staff"}
                        <PreviewStaffTable fromSearch={true /*fromSearch*/} showNothing={false}></PreviewStaffTable> <!-- Add callback for fetching staff associated with this user -->
                    {:else}
                        <PreviewStaffTable fromSearch={fromSearch} showNothing={true}></PreviewStaffTable> <!-- Add callback for fetching all staff -->
                    {/if}
                </div>
            </div>
        </div>
    </div>
</Page>