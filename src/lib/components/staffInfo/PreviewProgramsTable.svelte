<script>
    // @ts-nocheck
    /*
    * This component fetches and displays a table of programs assigned to a subordinate of the passed supervisor.
    * The table dynamically updates based on supervisor ID and user permissions.
    */
        import { onMount } from 'svelte';
        import { DefaultTooltipElement, EditButton, Page, PageBody, RadioInput, StatusTag, Table, PaginatedTable, NextButton, Alert, AlertCircleSmallIcon, ExportDataButton, TableRow, Toast, Card, HomeIcon, TooltipElement, PlusSmallIcon, ChevronSingleRightSmallIcon, LinkButton } from 'ascend-ui'
        import NextButtonNavigation from './components/NextButtonNavigation.svelte';
        
        export let fromSearch = false; // if the request is utilizing the search function.
        
        export let supervisorId;
        
        export let permissionLevel;

        export let showNothing = false; //testing function
    
        export let showSeeMore = true
        
        export let limit = 5;

        export let list = [];
    
        $: if (supervisorId) {
            fetchVisits({supervisorId:supervisorId, limit:limit});
        }

        onMount(() => { //Fetches the tabledata when the component is loaded 
            if (!showNothing) {
                fetchVisits({supervisorId:supervisorId, limit:limit});
                //list = [];
            } else {
                list = [];
            }
        });
    
        async function fetchVisits(params = {}) {
            try {
                const response = await fetch("/api/ProgramsController", {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(params),
                });
    
                if (!response.ok) throw new Error("Databast failed");
    
                const data = await response.json();
    
                console.log(data)
                
                list = data.users;
    
            } catch (error) {
                console.error("Login error:", error);
            }
        }
    
        const columns = [
            {
                title: 'DB Key',
                key: 'dbkey',
                type: 'text',
                styles: ['flex: 1', 'display:none'],
            },
            {
                title: 'Program',
                key: 'program_display_name',
                type: 'text',
                styles: ['flex: 2', 'min-width: 150px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Child',
                key: 'child_name',
                type: 'text',
                styles: ['flex: 2', 'min-width: 120px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Caregiver',
                key: 'staff_name',
                type: 'text',
                styles: ['flex: 1', 'min-width: 100px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Enrollment Date',
                key: 'enrollment_date',
                type: 'text',
                styles: ['flex: 1', 'min-width: 100px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Status',
                component: StatusTag,
                key: 'status',
                type: 'tag',
                tagMap: { 
                    active:'success', 
                    exited:'neutral',
                },
                styles: ['flex: 1', 'min-width: 100px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            }
        ];
</script>

<Card styles={[
    "border: 2px solid var(--primary-200)", 
    "border-radius: 10px","padding-left: 10px","padding-right: 10px", 
    "padding-bottom: 20px", 
    "box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.3)"
    ]}>
    <div style="display:flex; flex-direction:column; min-width:75vw; overflow-y:hidden; overflow-x:hidden; padding-bottom:10px;">
        <div style="display:flex; gap:20px; justify-content:space-between; padding-top:10px; padding-bottom:20px;">
        
            <!-- Left Section (HomeIcon + Title) -->
            <div style="display:flex; gap:20px; align-items:center; padding-bottom:20px">
                <HomeIcon></HomeIcon>
                <h2>Programs</h2>
                <DefaultTooltipElement><div><p></p></div></DefaultTooltipElement>
            </div>
    
            <div style="display:flex; gap:25px; align-items:center;">
                {#if showSeeMore==true}
                <LinkButton text="See More" rightIcon={ChevronSingleRightSmallIcon} styles={["text-decoration: underline"]} url={`/containers/programs-info/${supervisorId}`}></LinkButton>    
                {/if}
                
            </div>
        </div>
        <div style="display:flex; width:100%; justify-content:left; gap:30%; padding-bottom:45px; padding-left:30px; padding-right:30px;">
            <div style="display:flex; flex-direction:column; justify-items:left;">
                <p >Total Programs</p>
                <h1>12</h1>
            </div>
            <div style="display:flex; flex-direction:column; justify-items:left">
                <p >Active Programs</p>
                <h1>9</h1>
            </div>
            <div style="display:flex; flex-direction:column; justify-items:left">
                <p >Exited Programs</p>
                <h1>1</h1>
            </div>
        </div>
        {#if list.length != 0}
        <PaginatedTable
            {columns}
            {list}
        
        />
        {:else if list.length == 0 && fromSearch == false}
        <Alert
            icon={AlertCircleSmallIcon}
            title="No Programs To Display!"
            body="Contact your administrator about adding programs"
            />
        {/if}
    </div>
    
</Card>