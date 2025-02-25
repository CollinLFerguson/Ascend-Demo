import type { PageLoad } from './$types';

export const load = (async () => {
    return {
        user:{
            firstName: "John",
            lastName: "Doe"
        }
        

    };
}) satisfies PageLoad;