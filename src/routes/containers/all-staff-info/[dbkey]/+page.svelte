<script>
import { authenticatedUser } from '$lib/stores/authStore';
import { get } from 'svelte/store';
import PreviewStaffAssignedTable from '$lib/components/staffInfo/PreviewStaffAssignedTable.svelte';
    import { page } from '$app/stores';


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
<!--Weird 92% VH issue to prevent autoscroll failure or cliping over / under page.-->
<div style="padding-right:10px; padding-bottom:10px; overflow-y:scroll !important;  height: 92vh;">
    <PreviewStaffAssignedTable supervisorId={data?.staffKey} permissionLevel={currentUser?.permissions} showSeeMore={false} limit={null}> </PreviewStaffAssignedTable> <!-- Add callback for fetching staff associated with this user -->
</div>