<script>
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


</script>
<div style="padding-right:10px; padding-bottom:10px overflow-y:show !important;">
    <PreviewVisitsTable supervisorId={data?.staffKey} permissionLevel={currentUser?.permissions} showSeeMore={false} limit={null}> </PreviewVisitsTable> <!-- Add callback for fetching staff associated with this user -->
</div>