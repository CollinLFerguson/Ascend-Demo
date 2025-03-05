<script>
// @ts-nocheck
	import { Accordion, ChevronSingleRightSmallIcon, MainContent, Button, PageBody, Page, Card, HomeIcon, NewNotificationIcon, PageHeader, MetricCard, FilterAndSortButton, SearchBar, ExportCSVButton, ExportDataButton, TabBar, Icon, EditButton, StandardButton, LinkButton } from 'ascend-ui'
    import {GitHubIcon, LinkedInIcon, PreviewStaffTable} from '$lib/client/index'
    import { authenticatedUser } from '$lib/stores/authStore';
    import { get } from 'svelte/store';
    import { page } from '$app/stores';
    import { onMount } from 'svelte';
    import PreviewVisitsTable from '$lib/components/staffInfo/PreviewVisitsTable.svelte';
    import PreviewChildrenTable from '$lib/components/staffInfo/PreviewChildrenTable.svelte';
    import PreviewProgramsTable from '$lib/components/staffInfo/PreviewProgramsTable.svelte';
    import PreviewStaffAssignedTable from '$lib/components/staffInfo/PreviewStaffAssignedTable.svelte';
    import CaregiverMap from '$lib/components/staffInfo/CaregiverMap.svelte';
    
    export let data;
        
    let currentStaffMember;
    
    $: if (data?.staffKey) {
        console.log(data?.staffKey)
        console.log("CHANGE")
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
    
                
                currentStaffMember = responseData.users[0];
                console.log("Current Staff Member:",currentStaffMember)
    
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
                {#if currentStaffMember?.supervisor_id}
                <LinkButton text="View Supervisor" rightIcon={ChevronSingleRightSmallIcon} styles={["text-decoration: underline"]} url={'/containers/staff-info/' + currentStaffMember?.supervisor_id}></LinkButton>    
                {/if}
                <div style="display:flex; justify-content:left; width:100%; justify-content:space-between;">
                    <div style="display:flex; gap: 10px; justify-content:left">
                        {#if currentStaffMember?.status === 'active'}
                        <ExportCSVButton classes={["button", "button-wrapper"]} text="Archive" Icon={HomeIcon}></ExportCSVButton>
                        {:else}
                            <ExportCSVButton classes={["button", "button-wrapper"]} text="Un-Archive" Icon={HomeIcon}></ExportCSVButton>
                        {/if}
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
                <div style="display:flex; gap: 10px; justify-content:left; overflow-x:auto; min-width:1200px; padding-bottom:40px">
                    {#if currentTab == "Data"}
                        <div style="display:flex; flex-direction:column; gap: 20px; justify-content:center; padding-top:20px">
                            <!-- data?.staffKey -->
                            <PreviewVisitsTable supervisorId={data?.staffKey} permissionLevel={currentUser?.permissions}> </PreviewVisitsTable> <!-- Add callback for fetching staff associated with this user -->
                            <CaregiverMap supervisorId={data?.staffKey}></CaregiverMap>
                            <PreviewChildrenTable supervisorId={data?.staffKey} permissionLevel={currentUser?.permissions}></PreviewChildrenTable>
                            <PreviewProgramsTable supervisorId={data?.staffKey} permissionLevel={currentUser?.permissions}> </PreviewProgramsTable>
                            <PreviewStaffAssignedTable supervisorId={data?.staffKey} permissionLevel={currentUser?.permissions}> </PreviewStaffAssignedTable>
                        </div>
                    {:else}
                        <h1>personal details</h1>
                    {/if}
                </div>
                <br>
                <br>
            </div>
        </div>
    </div>
</Page>