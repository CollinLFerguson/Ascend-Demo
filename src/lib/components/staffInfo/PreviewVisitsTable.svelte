<script>
    // @ts-nocheck
    
        import { onMount } from 'svelte';
        import { DefaultTooltipElement, EditButton, Page, PageBody, RadioInput, StatusTag, Table, PaginatedTable, NextButton, Alert, AlertCircleSmallIcon, ExportDataButton, TableRow, Toast, Card, HomeIcon, TooltipElement, PlusSmallIcon, ChevronSingleRightSmallIcon, LinkButton } from 'ascend-ui'
        import NextButtonNavigation from './components/NextButtonNavigation.svelte';
        
        export let fromSearch = false; // if the request is utilizing the search function.
        
        export let supervisorId;
        
        export let permissionLevel;

        export let showNothing = false; //testing function
    
        
        export let list = [];
    
        onMount(() => { //Fetches the tabledata when the component is loaded 
            if (!showNothing) {
                fetchVisits({supervisorId:supervisorId, limit:5});
                //list = [];
            } else {
                list = [];
            }
        });
    
        async function fetchVisits(params = {}) {
            try {
                const response = await fetch("/api/VisitsController", {
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
                styles: ['flex: 1', 'overflow: hidden', "display:none"],
              },	
            {
                title: 'Child',
                key: 'child_name',
                type: 'text',
                styles: ['flex: 2', 'max-width: 250px', 'min-width: 250px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Caregiver',
                key: 'staff_name',
                type: 'text',
                styles: ['flex: 2', 'max-width: 150px', 'min-width: 150px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Program',
                key: 'program_name',
                type: 'text',
                styles: ['flex: 2', 'min-width: 250px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Mileage',
                key: 'mileage',
                type: 'text',
                styles: ['flex: 2', 'max-width: 100px', 'min-width: 100px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Visit',
                key: 'visit_date',
                type: 'text',
                styles: ['flex: 2', 'max-width: 150px', 'min-width: 100px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
            },
            {
                title: 'Status',
                component: StatusTag,
                key: 'status',
                type: 'tag',
                tagMap: { 
                    cancelled:'warning', 
                    attempted:'warning', 
                    unconfirmed:'neutral', 
                    completed:'success',
                    "no-show":'warning', /*tooltips: { approved: 'Provider listing has been published to the external LocalHelpNow directory.' }*/},
                styles: ['flex: 2', 'max-width: 250px', 'min-width: 120px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'], //'max-width: 140px', 'min-width: 100px',
            },
        ]
    </script>

<Card styles={[
    "border: 2px solid var(--primary-200)", 
    "border-radius: 10px","padding-left: 10px","padding-right: 10px", 
    "padding-bottom: 20px", 
    "box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.3)",
    "overflow-x:hidden!important"
    ]}>
    <div style="display:flex; flex-direction:column; overflow-y:hidden; overflow-x:hidden;">
        <div style="display:flex; gap:20px; justify-content:space-between; padding-top:10px; padding-bottom:20px;">
        
            <!-- Left Section (HomeIcon + Title) -->
            <div style="display:flex; gap:20px; align-items:center; padding-bottom:20px">
                <HomeIcon></HomeIcon>
                <h2>Visits</h2>
                <DefaultTooltipElement><div><p></p></div></DefaultTooltipElement>
            </div>
    
            <div style="display:flex; gap:25px; align-items:center;">
                
                {#if permissionLevel < 2}
                <LinkButton text="Add" leftIcon={PlusSmallIcon} styles={["text-decoration: underline", "gap:5px"]}></LinkButton>
                {/if}
                
                <LinkButton text="See More" rightIcon={ChevronSingleRightSmallIcon} styles={["text-decoration: underline"]} ></LinkButton>
            </div>
        </div>
        <div style="display:flex; width:100%; justify-content:left; gap:15%; padding-bottom:45px; padding-left:30px; padding-right:30px;">
            <div style="display:flex; flex-direction:column; justify-items:left;">
                <p >Total Visits</p>
                <h1>12</h1>
            </div>
            <div style="display:flex; flex-direction:column; justify-items:left">
                <p >Complete</p>
                <h1>9</h1>
            </div>
            <div style="display:flex; flex-direction:column; justify-items:left">
                <p >Attempt</p>
                <h1>1</h1>
            </div>
            <div style="display:flex; flex-direction:column; justify-items:left">
                <p >Cancel</p>
                <h1>1</h1>
            </div>
            <div style="display:flex; flex-direction:column; justify-items:left">
                <p >No-Shows</p>
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
            title="No Visits To Display!"
            body="Have an assigned caregiver"
            />
        {/if}
    </div>
    
</Card>