import { DatabaseConnector } from '$lib/server';
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({request}) => {
    const db = new DatabaseConnector();
    try {        
        const requestBody = await request.json();

        let dbkey:number = requestBody.dbkey
        let userType:string = requestBody.type
        let searchTerm:string = requestBody.term
        let allowedStatuses:string[] = requestBody.statuses
        let assignedProgramKeys:number[] = requestBody.programs

        let sql = `
            WITH filtered_users AS (
                SELECT 
                    u.*, 
                    (u.first_name || ' ' || u.last_name) AS name
                FROM users u
                WHERE 1=1 `
        const params: any[] = [];
        
        // When copy-pasting this into other files, change this to all the columns you would like to be able to perform searches on.
        const likeTerms = ["first_name", "last_name", "title", "email"] 
        
        if (dbkey) {
            // AND dbkey = $1
            sql += ` AND dbkey = $${params.length + 1}`;
            params.push(dbkey);
        }

        if (userType) {
            // Suppose userType is also a column in your table?
            sql += ` AND type = $${params.length + 1}`;
            params.push(userType);
        }
        
        if (searchTerm && searchTerm.length > 0) {
            const orParts: string[] = [];
            for (const col of likeTerms) {
                // Create a placeholder with the next index
                const placeholderIndex = params.length + 1;
                orParts.push(`${col} ILIKE $${placeholderIndex}`);
                // push the same value: `%searchTerm%`
                params.push(`%${searchTerm}%`);
            }

            sql += ` AND (${orParts.join(' OR ')})`;
        }
        
        if (allowedStatuses && allowedStatuses.length > 0) {
            const orParts: string[] = [];
            for (const status of allowedStatuses) {
                const placeholderIndex = params.length + 1;
                orParts.push(`status = $${placeholderIndex}`);
                params.push(status);
            }
            sql += ` AND (${orParts.join(' OR ')})`;
        }

        if (assignedProgramKeys && assignedProgramKeys.length > 0) {
            // AND (program = $X OR program = $Y OR ...)
            const orParts: string[] = [];
            for (const key of assignedProgramKeys) {
                const placeholderIndex = params.length + 1;
                orParts.push(`program = $${placeholderIndex}`);
                params.push(key);
            }
            sql += ` AND (${orParts.join(' OR ')})`;
        }

        sql += `) 
        SELECT 
        fu.*, 
        COALESCE(s.first_name || ' ' || s.last_name, 'N/A') AS supervisor_name,
        p.program_name,
        p.program_display_name
        FROM filtered_users fu
        LEFT JOIN users s ON fu.supervisor_id = s.dbkey
        LEFT JOIN programs p ON fu.program = p.dbkey
        `

        console.log(sql) 
        //return

        await db.connect();
        const users = await db.query(sql, params);
        return json({ users });
    } catch (error) {
        console.error('Database error:', error);
        return new Response(
        JSON.stringify({ error: 'Database query failed: ' + error }),
        { status: 500 }
        );
    } finally {
        await db.close();
    }
};