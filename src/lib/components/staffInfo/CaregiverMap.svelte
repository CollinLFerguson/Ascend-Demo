<script>
// @ts-nocheck


    import { Alert, AlertCircleSmallIcon, Chart } from "ascend-ui";
    import { onMount } from "svelte";

    export let supervisorId;

    let markers = 'https://local-help-now.s3.us-east-2.amazonaws.com/Pin.svg';

    let caregiverList = []

    onMount(() => { //Fetches the tabledata when the component is loaded 
        fetchCaregivers({supervisorId:supervisorId, type:"caregiver"});
    });

    async function fetchCaregivers(params = {}) {
        try {
            const response = await fetch("/api/CareGiverMapController", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(params),
            });

            if (!response.ok) throw new Error("Databast failed");

            const data = await response.json();

            console.log("Caregiver Location", data)
            
            let rawCaregiverList = data.users;
            console.log("Caregiver Location: Raw", rawCaregiverList)

            if(rawCaregiverList?.length > 0){
                console.log("here")
                caregiverList = rawCaregiverList.map(item => ({
                    ...item,
                    lat: item.lat ?? 0, // Default to 0 if lat is missing
                    lng: item.lng ?? 0,
                    marker: markers
                }))
            }
            
            console.log("Caregiver Location: Post Transform", caregiverList)

        } catch (error) {
            console.error("Login error:", error);
        }
    }

	let realData = [
		{
			full_address: ' Wyoming Street, Dayton, OH 45409',
			street: '1 Wyoming Street',
			city: 'Dayton',
			state: 'OH',
			zip: '45409',
			lat: 39.74468936344823,
			lng: -84.18755780100692,
			name: 'Miami Valley Hospital',
			count: 15,
			type: 'hospital',
			url: 'https://www.example.com',
			marker: markers,
		},
		{
			full_address: '405 W Grand Ave, Dayton, OH 45405',
			street: '405 W Grand Ave',
			city: 'Dayton',
			state: 'OH',
			zip: '45405',
			lat: 39.770033831326764,
			lng: -84.2026657451856,
			name: 'Kettering Health - Dayton',
			count: 10,
			type: 'hospital',
			url: 'https://www.example.com',
			marker: markers,
		},
		{
			full_address: '3535 Southern Blvd, Kettering, OH 45429',
			street: '3535 Southern Blvd',
			city: 'Kettering',
			state: 'OH',
			zip: '45429',
			lat: 39.69714763919204,
			lng: -84.19111608751633,
			name: 'Kettering Health - Main Campus',
			count: 1,
			type: 'hospital',
			url: 'https://www.example.com',
			marker: markers,
		},
		{
			full_address: '3417 Marshall Rd, Dayton, OH 45429',
			street: '3417 Marshall Rd',
			city: 'Dayton',
			state: 'OH',
			zip: '45429',
			lat: 39.69683452972968,
			lng: -84.14159441635228,
			name: 'Eastway Behavioral Health',
			count: 407,
			type: 'provider',
			url: 'https://www.example.com',
			marker: markers,
		},
		{
			full_address: '3095 Kettering Blvd, Moraine, OH 45439',
			street: '3095 Kettering Blvd',
			city: 'Moraine',
			state: 'OH',
			zip: '45439',
			lat: 39.70618516837155,
			lng: -84.20367446053149,
			name: 'South Community',
			count: 868,
			type: 'provider',
			url: 'https://www.example.com',
			marker: markers,
		},
		{
			full_address: '707 S Edwin C Moses Blvd, Dayton, OH 45417',
			street: '707 S Edwin C Moses Blvd',
			city: 'Dayton',
			state: 'OH',
			zip: '45417',
			lat: 39.7467775042141,
			lng: -84.19794147402233,
			name: 'Samaritan Behavioral Health',
			count: 2,
			type: 'provider',
			url: 'https://www.example.com',
			marker: markers,
		},
		{
			full_address: '11 W Monument Ave, Dayton, OH 45402',
			street: '11 W Monument Ave',
			city: 'Dayton',
			state: 'OH',
			zip: '45402',
			lat: 39.76412035481474,
			lng: -84.1935038163499,
			name: 'Places Inc',
			count: 64,
			type: 'provider',
			url: 'https://www.example.com',
			marker: markers,
		},
		{
			full_address: '330 W 2nd St, Dayton, OH 45422',
			street: '330 W 2nd St',
			city: 'Dayton',
			state: 'OH',
			zip: '45422',
			lat: 39.75987081414062,
			lng: -84.19777583169365,
			name: 'Montgomery County Jail',
			count: 58,
			type: 'jail',
			url: 'https://www.example.com',
			marker: markers,
		},
	]

</script>

{#if caregiverList.length > 0}
<div class="geo-chart">
    <Chart
        title="Caregiver Home Addresses"
        type="geo"
        mapId="first-map"
        pillText="Caregiver Program"
        pillKey="program_display_name"
        infoTitleKey="caregiver_name"
        data={caregiverList}
        geoJSON={null}
    />
</div>
{:else}
    <Alert
    icon={AlertCircleSmallIcon}
    title="No Caregivers To Display!"
    body="Have a caregiver assigned to this staff member."
    />
{/if}

<style>
    .geo-chart {
        
        max-width: 100vw;
        min-width: 1000px;
        height: 650px;
        & .headline-s-m {
            margin-bottom: var(--spacing09);
        }
        & details {
            padding-top: var(--spacing04);
        }
    }
</style>