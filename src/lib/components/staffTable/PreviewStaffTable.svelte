<script>
	import { onMount } from 'svelte';
	import { EditButton, Page, PageBody, RadioInput, StatusTag, Table, PaginatedTable, NextButton, Alert, AlertCircleSmallIcon, ExportDataButton, TableRow } from 'ascend-ui'
    import NextButtonNavigation from './components/NextButtonNavigation.svelte';
	
	export let fromSearch = false; // if the request is utilizing the search function.
	
	export let searchTerm = "";
	export let programs = [];
	export let allowedStatus = [];
	
	export let showNothing = false; //testing function

	
	export let list = [];

	onMount(() => { //Fetches the tabledata when the component is loaded 
		if (!showNothing) {
			fetchUsers({type:"staff", term:searchTerm, programs:programs, statuses:allowedStatus});
			//list = [];
		} else {
			list = [];
		}
	});

	async function fetchUsers(params = {}) {
		try {
			const response = await fetch("/api/StaffController", {
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
	
	async function handleButtonClick_1(){
		console.log("here!")

		try {
			const response = await fetch("/api/StaffController", {
				method: "POST",
				headers: { "Content-Type": "application/json" },
				body: JSON.stringify({type:"staff"}),
			});

			if (!response.ok) throw new Error("Databast failed");

			const data = await response.json();
			console.log(data)
			return data
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
			title: 'Name',
			key: 'name',
			type: 'text',
			styles: ['flex: 2', 'max-width: 250px', 'min-width: 250px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
		},
		{
			title: 'Title',
			key: 'title',
			type: 'text',
			styles: ['flex: 2', 'max-width: 250px', 'min-width: 250px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
		},
		{
			title: 'Program',
			key: 'program_display_name',
			type: 'text',
			styles: ['flex: 2', , 'text-overflow: ellipsis','overflow: hidden', 'font-weight: bold'] //'max-width: 250px', 'min-width: 100px'
		},
		{
			title: 'Supervisor',
			key: 'supervisor_name',
			type: 'text',
			styles: ['flex: 2', 'max-width: 250px', 'min-width: 250px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
		},
		{
			title: 'Status',
			component: StatusTag,
			key: 'status',
			type: 'tag',
			tagMap: { active: 'warning', archived: 'neutral', /*tooltips: { approved: 'Provider listing has been published to the external LocalHelpNow directory.' }*/},
			styles: ['flex: 1',  'overflow: hidden'], //'max-width: 140px', 'min-width: 100px',
		},
		{
			title: 'Action',
			key: 'action',
			type: 'button',
			onclick: () => alert("in"),
			component: NextButtonNavigation,
		}
	]
</script>


{#if list.length != 0}
<PaginatedTable
	{columns}
	{list}

/>
{:else if list.length == 0 && fromSearch == false}
<Alert
	icon={AlertCircleSmallIcon}
	title="No Staff Member To Display!"
	body="When staff members are assigned to you they will appear here."
	/>
{:else if list.length == 0 && fromSearch == true}
	<Alert
	icon={AlertCircleSmallIcon}
	title="No Results To Display!"
	body="No staff members fit your current filter or search terms. Please clear or change your filters or search to view results."
/>
{/if}

<NextButton callback={handleButtonClick_1} />