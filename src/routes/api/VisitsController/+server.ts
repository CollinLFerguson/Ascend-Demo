import { DatabaseConnector } from '$lib/server';
import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';

export const POST: RequestHandler = async ({request}) => {
    const db = new DatabaseConnector();
    try {        
        const requestBody = await request.json();

        let supervisorId:number = requestBody.supervisorId  
        let limit:number = requestBody.limit
        
        const params: any[] = [supervisorId];

        /*
        This will gather all caregivers whose supervisor is the passed staff member
        Then it will gather all visits 
        */ 
        let sql = `
        SELECT
            visits.*,
            TO_CHAR(visits.visit_date, 'MM/DD/YYYY') AS visit_date,
            users.first_name || ' ' || users.last_name AS staff_name,
            users.supervisor_id,
            programs.program_display_name AS program_name,
            children.first_name || ' ' || children.last_name AS child_name
        FROM visits
        JOIN users
            ON users.dbkey = visits.staff_dbkey
        JOIN programs
            ON programs.dbkey = visits.assigned_program_dbkey
        JOIN children
            ON children.dbkey = visits.assigned_child_dbkey
        WHERE users.type = 'caregiver'
            AND users.supervisor_id = $1
        ORDER BY visits.visit_date DESC
        `
        
        
        if(limit){
            sql += ` LIMIT $2`
            params.push(limit)
        }

        sql+= ";"

        

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
