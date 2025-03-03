import { json } from '@sveltejs/kit';
import type { PageLoad } from '../$types';
import { goto } from '$app/navigation';
import { authStore, isAuthenticated, authenticatedUser} from '../../lib/stores/authStore';

let API_URL = "/api/LoginController"

export const load = (async () => {
    //stub login process
    const submitLogin = (selectedUser:string) => {
        let loginInfo
        console.log("SELECTED USER: ", selectedUser)
        switch(selectedUser){
            case "Super Admin User":
                loginInfo = {username: "61", "password": "1"} //super admin user. has perm level 0 
                break;
            case "Supervisor User":
                loginInfo = {username: "4", "password": "1"} //supervisor user perm level 1
                break;
            case "Home User":
                loginInfo = {username: "12", "password": "1"} // home user perm level 4
                break;
            default:
                loginInfo = {username: "61", "password": "1"} //super admin user. has perm level 0 
                break;
        }
        
        authStore.login(loginInfo['username'], loginInfo['password'])
        .then(()=> {
            let auth_state;
            let currentUser;

            isAuthenticated.subscribe(value => {
                console.log('User is authenticated:', value);
                auth_state = value
            });

            authenticatedUser.subscribe(value => {
                console.log('User is authenticated:', value);
                currentUser = value
            });

            if (auth_state){
                
                goto("/containers/staff")
            } else {
               goto("/auth") //on failure to login.
            }
        })
    }

    return {submitLogin};
}) satisfies PageLoad;