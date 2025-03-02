<script>
	import { EditButton, Page, PageBody, RadioInput, StatusTag, Table, PaginatedTable, NextButton, Alert, AlertCircleSmallIcon, ExportDataButton, TableRow } from 'ascend-ui'
    import NextButtonNavigation from './components/NextButtonNavigation.svelte';
	export let fromSearch;
	export let showNothing;


	function generateRandomData() {
		const names = ["John Doe", "Jane Smith", "Michael Johnson", "Emily Davis", "David Wilson"];
		const domains = ["example.com", "randommail.com", "testemail.com", "fakeemail.com"];
		const statuses = ["Approved", "Pending"];
		
		function getRandomItem(arr) {
			return arr[Math.floor(Math.random() * arr.length)];
		}

		const data = [];
		
		for (let i = 0; i < 50; i++) {
			const name = getRandomItem(names);
			const email = `${name.split(' ').join('.').toLowerCase()}@${getRandomItem(domains)}`;
			const status = getRandomItem(statuses);
			const date = generateRandomDate();
			
			data.push({
				name: name,
				email: email,
				status: status,
				date: date,
				dbkey: i
			});
		}

		return data;
	}

	const randomData = generateRandomData();
	let list = randomData

	function generateRandomDate() {
		const startDate = new Date(2000, 0, 1); // Start from January 1, 2000
		const endDate = new Date(); // Current date

		// Generate a random timestamp between start and end date
		const randomTimestamp = startDate.getTime() + Math.random() * (endDate.getTime() - startDate.getTime());

		// Create a new Date object with the random timestamp
		const randomDate = new Date(randomTimestamp);

		// Extract the date components
		const month = String(randomDate.getMonth() + 1).padStart(2, '0'); // Months are 0-indexed
		const day = String(randomDate.getDate()).padStart(2, '0');
		const year = randomDate.getFullYear();

		// Return the formatted date
		return `${month}-${day}-${year}`;
	}


	
	function handleButtonClick_1(row){
		console.log("buttonclick", row);
	}
	/*
	const NextButtonWithClick = () => ({
		component: NextButton,
		props: {
			onClick: () => handleButtonClick(), // Ensures the handler is correctly set
		},
	});
	*/

	if(showNothing){
		list = [];
	}

	const columns = [
		{
			title: 'Name',
			key: 'name',
			type: 'text',
			styles: ['flex: 2', 'max-width: 250px', 'min-width: 250px', 'white-space: nowrap', 'overflow: hidden', 'text-overflow: ellipsis', 'font-weight: bold'],
		},
		{
			title: 'Email',
			key: 'email',
			type: 'text',
			styles: ['flex: 2', , 'text-overflow: ellipsis','overflow: hidden'] //'max-width: 250px', 'min-width: 100px'
		},
		{
			title: 'Tag',
			component: StatusTag,
			key: 'status',
			type: 'tag',
			tagMap: { approved: 'warning', pending: 'neutral', /*tooltips: { approved: 'Provider listing has been published to the external LocalHelpNow directory.' }*/},
			styles: ['flex: 1',  'overflow: hidden'], //'max-width: 140px', 'min-width: 100px',
		},
		{
			title: 'Date',
			type: 'datetime',
			key: 'date',
			styles: ['flex: 1',  'overflow: hidden'] //'max-width: 150px', 'min-width: 100px',
		}
		,
		{
			title: 'Action',
			key: 'action',
			type: 'button',
			onclick: () => alert("in"),
			component: NextButtonNavigation,
			componentProps: () => ({
				row: { name: 'Fake Name', email: 'fake@example.com' },
				callback: () => handleButtonClick_1('fake-row')
			})
		},  
		{
    	title: 'DB Key',
    	key: 'dbkey',
    	type: 'text',
    	styles: ['flex: 1', 'overflow: hidden', "display:none"],
  },




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

<NextButtonNavigation row={{ name: "Test", email: "test@example.com" }} callback={() => console.log("Clicked!")} />