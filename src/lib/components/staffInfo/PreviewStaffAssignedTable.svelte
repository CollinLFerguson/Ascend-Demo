<script>
    // @ts-nocheck
    
        import { onMount } from 'svelte';
        import { DefaultTooltipElement, EditButton, LinkButton, Page, PageBody, RadioInput, StatusTag, Table, PaginatedTable, NextButton, Alert, AlertCircleSmallIcon, ExportDataButton, TableRow, Toast, Card, HomeIcon, TooltipElement, PlusSmallIcon, ChevronDoubleRightSmallIcon, ChevronSingleRightSmallIcon } from 'ascend-ui'
        import NextButtonNavigation from './components/NextButtonNavigation.svelte';
    import PreviewStaffTable from '../staffTable/PreviewStaffTable.svelte';
        
        export let fromSearch = false; // if the request is utilizing the search function.
        
        export let supervisorId;
        export let showSeeMore= true 
        export let limit= 5
        export let permissionLevel;

        export let showNothing = false; //testing function

    </script>
<Card styles={[
    "border: 2px solid var(--primary-200)", 
    "border-radius: 10px","padding-left: 10px","padding-right: 10px", 
    "padding-bottom: 20px", 
    "box-shadow: 6px 6px 15px rgba(0, 0, 0, 0.3)"
    ]}>
    <div style="display:flex; flex-direction:column; min-width:75vw; overflow-y:auto; overflow-x:hidden; padding-bottom:10px">
        <div style="display:flex; gap:20px; justify-content:space-between; padding-top:10px; padding-bottom:20px;">
        
            <!-- Left Section (HomeIcon + Title) -->
            <div style="display:flex; gap:20px; align-items:center; padding-bottom:20px">
                <HomeIcon></HomeIcon>
                <h2>Staff Assigned</h2>
                <DefaultTooltipElement><div><p></p></div></DefaultTooltipElement>
            </div>
    
            <div style="display:flex; gap:0px; align-items:center;">
                {#if showSeeMore==true}
                <LinkButton text="See More" rightIcon={ChevronSingleRightSmallIcon} styles={["text-decoration: underline"]} url={`/containers/all-staff-info/${supervisorId}`}></LinkButton>    
                {/if}
            </div>
        </div>
        <div style="display:flex; width:100%; justify-content:left; gap:30%; padding-bottom:45px; padding-left:30px; padding-right:30px;">
            <div style="display:flex; flex-direction:column; justify-items:left;">
                <p >My Staff</p>
                <h1>12</h1>
            </div>
        </div>
        <PreviewStaffTable supervisorId={supervisorId} limit={limit}></PreviewStaffTable>
    </div>
    
</Card>