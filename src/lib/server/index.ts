//This exports the server side only components. So anything that interfaces with NODE, etc. Prevents the client from crashing.

import '$lib/client'
//classes 
export {DatabaseConnector} from '$lib/class/databaseController'