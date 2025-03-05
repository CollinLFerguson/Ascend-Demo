<script>
// @ts-nocheck
/*
This was a really fun component to work on. It calls the backend to fetch
all caregiver users that work under the passed supervisor. 
It then uses the GeoMap component to place the pins on the map.
*/

    import { Alert, AlertCircleSmallIcon, Card, Chart, HomeIcon, DefaultTooltipElement } from "ascend-ui";
    import { onMount } from "svelte";

    export let supervisorId;

    let markers = 'https://local-help-now.s3.us-east-2.amazonaws.com/Pin.svg';

    let caregiverList = []

    $: if (supervisorId) {
        fetchCaregivers({supervisorId:supervisorId, type:"caregiver"});
    }

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
            else{
                caregiverList=[]
            }
            
            console.log("Caregiver Location: Post Transform", caregiverList)

        } catch (error) {
            console.error("Login error:", error);
        }
    }

</script>
<Card styles={[
    "border: 2px solid var(--primary-200)", 
    "border-radius: 10px","padding-left: 10px","padding-right: 10px", 
    "padding-bottom: 20px"
    ]}>
    <div style="display:flex; flex-direction:column; min-width:75vw; overflow-y:hidden; overflow-x:hidden">
        <div style="display:flex; gap:20px; justify-content:space-between; padding-top:10px; padding-bottom:20px;">
        
            <!-- Left Section (HomeIcon + Title) -->
            <div style="display:flex; gap:20px; align-items:center; padding-bottom:20px">
                <HomeIcon></HomeIcon>
                <h2>Caregivers</h2>
                <DefaultTooltipElement><div><p></p></div></DefaultTooltipElement>
            </div>
        </div>
                {#if caregiverList.length > 0}

                <div class="geo-chart">
                    <Chart
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
    </div>
</Card>

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