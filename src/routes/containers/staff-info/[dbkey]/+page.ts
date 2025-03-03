import type { PageLoad } from '../$types';

export const load: PageLoad = async ({ params }) => {
    return {
        staffKey: params.dbkey
    };
};