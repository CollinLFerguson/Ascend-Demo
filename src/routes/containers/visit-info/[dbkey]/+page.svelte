<script>
import { authenticatedUser } from '$lib/stores/authStore';
import { get } from 'svelte/store';
import PreviewVisitsTable from '$lib/components/staffInfo/PreviewVisitsTable.svelte';

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