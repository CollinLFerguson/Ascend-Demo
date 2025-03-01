<script>
    import { NextButton } from "ascend-ui";
    export let rowData;
    export let handleButtonClick;

    export let rest = {};

    function handleButtonClick1(){
		console.log(window.location="/components/staffInfo");
	}
    function printRowData(rowData){
        console.log("Row Data", rowData);
    }

</script>

<NextButton
    callback={(rowData) => printRowData(rowData)}
/>