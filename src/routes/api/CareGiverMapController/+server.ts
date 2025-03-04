import { DatabaseConnector } from '$lib/server';
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

/*
Re-use of the staff controller. I would have made it general purpose, but wasting time of changing the request type
didn't seem like a good use of time.
*/

export const POST: RequestHandler = async ({request}) => {
    const db = new DatabaseConnector();
    try {        
        const requestBody = await request.json();

        let dbkey:number = requestBody.dbkey
        let supervisorId = requestBody.supervisorId
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
        
        if (dbkey) {
            // AND dbkey = $1
            sql += ` AND dbkey = $${params.length + 1}`;
            params.push(dbkey);
        }

        if (supervisorId) {
            // AND dbkey = $1
            sql += ` AND supervisor_id = $${params.length + 1}`;
            params.push(supervisorId);
        }

        if (userType) {
            // Suppose userType is also a column in your table?
            sql += ` AND type = $${params.length + 1}`;
            params.push(userType);
        }
        
        sql += `) 
        SELECT 
        fu.title,
        COALESCE(fu.first_name || ' ' || fu.last_name, 'N/A') AS caregiver_name,
        COALESCE(s.first_name || ' ' || s.last_name, 'N/A') AS supervisor_name,
        CAST(fu.latitude AS FLOAT) as lat,
        CAST(fu.longitude AS FLOAT) as lng,
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
