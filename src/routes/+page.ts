import { json } from '@sveltejs/kit';
import type { PageLoad } from './$types';

let API_URL = "/api/login"

export const load = (async () => {
    
    let selectedUser = "";
    const submitLogin = () => {
        let loginInfo
        console.log("SELECTED USER: ", selectedUser)
        switch(selectedUser){
            case "Super Admin User":
                loginInfo = {username: "SA", "password": "1"}
                break;
            case "Supervisor User":
                loginInfo = {username: "SV", "password": "1"}
                break;
            case "Home User":
                loginInfo = {username: "HU", "password": "1"}
                break;
            default:
                loginInfo = {username: "SA", "password": "1"}
                break;
        }
        
        fetch(API_URL, {
            method: "POST",
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(loginInfo)
            })
        .then(() => {window.location = "/containers/staff"})
    }

    return {submitLogin, selectedUser};
}) satisfies PageLoad;