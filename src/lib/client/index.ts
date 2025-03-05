/*
This file is meant for client-side only imports. This prevents crashes related to NODE.js modules.
*/
// --- DEFAULT --- //
export default './stylesheets/global.css'

// --- ASSETS --- //
// Icons
export { default as GitHubIcon } from '$lib/assets/GitHubIcon.svelte'
export { default as LinkedInIcon } from '$lib/assets/LinkedInIcon.svelte'

// Tables
export {default as PreviewStaffTable} from '$lib/components/staffTable/PreviewStaffTable.svelte'

//classes 
//export {DatabaseConnector} from '$lib/class/databaseController'