import { readable } from 'svelte/store';
/*
This is the Auth store, it is a readonly store that contains the CSRF Auth token
And the logged in user's Id.
*/

export const auth = readable(null, async (set) => {
    try {
        const res = await fetch('/api/auth', { credentials: 'include' });
        if (res.ok) {
            const user = await res.json();
            set(user); // Set the authenticated user
        } else {
            set(null); // No user is logged in
        }
    } catch (error) {
        console.error("Auth fetch failed", error);
        set(null);
    }
});