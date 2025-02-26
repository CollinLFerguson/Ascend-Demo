<script>
	import { EditButton, Page, PageBody, RadioInput, StatusTag, Table, PaginatedTable, NextButton } from 'ascend-ui'

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
				date: date
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


	// let list = [
	// 	{
	// 		array: ['1', '3', '5'],
	// 		boolean: true,
	// 		button: EditButton,
	// 		checkbox: false,
	// 		date: '1/10/2022',
	// 		default: 'B Default Text',
	// 		editable: 'B Editable Text',
	// 		radio: true,
	// 		status: 'pending',
	// 		logoKey: '/src/lib/assets/images/default-logo.png',
	// 		key: 'Text One',
	// 		linkKey: '1234567890',
	// 	},
	// 	{
	// 		array: ['2', '4', '6'],
	// 		boolean: false,
	// 		button: EditButton,
	// 		checkbox: true,
	// 		date: new Date('10/6/2023'),
	// 		default: 'A Default Text',
	// 		editable: 'A Editable Text',
	// 		radio: false,
	// 		status: 'Approved',
	// 		logoKey: '/src/lib/assets/images/default-logo.png',
	// 		key: 'Text Two',
	// 		linkKey: '',
	// 	},
	// 	{
	// 		array: ['1', '2', '3'],
	// 		boolean: true,
	// 		button: EditButton,
	// 		checkbox: true,
	// 		date: new Date('12/12/2024'),
	// 		default: 'C Default Text',
	// 		editable: 'C Editable Text',
	// 		radio: true,
	// 		status: 'pending',
	// 	},
	// ]

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
			tagMap: { approved: 'warning', pending: 'neutral', tooltips: { approved: 'Provider listing has been published to the external LocalHelpNow directory.' }},
			styles: ['flex: 1',  'overflow: hidden'], //'max-width: 140px', 'min-width: 100px',
		},
		{
			title: 'Date',
			type: 'datetime',
			key: 'date',
			styles: ['flex: 1',  'overflow: hidden'] //'max-width: 150px', 'min-width: 100px',
		},
		{
			component: NextButton,
			key: 'button',
			type: 'button',
			styles: ['flex: 1', "justify-items:right", "padding-right:20px", 'overflow: hidden'],
		},
	]
</script>
		<PaginatedTable
			{columns}
			{list}
		/>
