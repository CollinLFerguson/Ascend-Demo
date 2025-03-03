<script>
// @ts-nocheck
	import { Accordion, MainContent, Button, PageBody, Page, Card, HomeIcon, NewNotificationIcon, PageHeader, MetricCard, FilterAndSortButton, SearchBar, ExportCSVButton, ExportDataButton, TabBar, Icon, EditButton, StandardButton } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon, PreviewStaffTable} from '$lib/client/index'
    import { authenticatedUser } from '$lib/stores/authStore';
    import { get } from 'svelte/store';
    import { page } from '$app/stores';
    import { onMount } from 'svelte';
    import PreviewVisitsTable from '$lib/components/staffInfo/PreviewVisitsTable.svelte';
    
    export let data;

    let currentStaffMember;
    
    $: if (data?.staffKey) {
        fetchCurrentStaff();
    }

    async function fetchCurrentStaff() {
        if(!data?.staffKey){return}    
        try {
                const response = await fetch("/api/StaffController", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify({dbkey:data?.staffKey}),
                });
    
                if (!response.ok) throw new Error("Databast failed");
    
                const responseData = await response.json();
    
                console.log(responseData)
                currentStaffMember = responseData.users[0];
    
            } catch (error) {
                console.error("Login error:", error);
            }
        }

    let currentUser = get(authenticatedUser) 
    
    let tabList=[
        {name:"Data"},
        {name:"Personal Details"}
    ]

    let currentTab = "Data"
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
                <PageHeader titleText={currentStaffMember?.name} titleJustification="left" styles={["justify-content:left", "width:100%!important"]} >
                </PageHeader>
            </div>
            <div style="display:flex; flex-direction:column;  gap: 20px;">
                <div style="display:flex; justify-content:left; width:100%; justify-content:space-between;">
                    <div style="display:flex; gap: 10px; justify-content:left">
                        <ExportCSVButton classes={["button", "button-wrapper"]} text="Archive" Icon={HomeIcon}></ExportCSVButton>
                        <ExportCSVButton text="Export Milage"></ExportCSVButton>
                    </div>
                    <div style="display:flex;  justify-content:right;">
                        <ExportCSVButton text="Edit Login Info" Icon={HomeIcon}></ExportCSVButton>
                        <ExportCSVButton text="Edit Profile" Icon={HomeIcon}></ExportCSVButton>
                    </div>
                </div>
            </div>
        </div>
        <div> <!--Content Section-->
            <div style="display:flex; gap: 10px; justify-content:left">
                <TabBar bind:currentTab {tabList} on:tabselect={handleTabSelect} />
            </div>
            <div style= "display:flex; flex-direction:column; gap:20px;">
                <hr style="max-width:93%">
                <div style="display:flex; gap: 10px; justify-content:left; overflow-x:auto; min-width:1200px">
                    {#if currentTab == "Data"}
                        <PreviewVisitsTable supervisorId={currentUser?.dbkey}> </PreviewVisitsTable> <!-- Add callback for fetching staff associated with this user -->
                    {:else}
                        <h1>personal details</h1>
                    {/if}
                </div>
            </div>
        </div>
    </div>
</Page>