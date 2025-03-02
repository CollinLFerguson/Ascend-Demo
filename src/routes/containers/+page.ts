import { json } from '@sveltejs/kit';
import type { PageLoad } from '../$types';
import { goto } from '$app/navigation';

let API_URL = "/api/LoginController"

export const load = (async () => {
    const submitLogin = (selectedUser:string) => {
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
        .then(() => goto("/"), {replaceState: true, reload: true })
    }

    return {submitLogin};
}) satisfies PageLoad;