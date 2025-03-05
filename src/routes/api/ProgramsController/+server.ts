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
        Then it will gather all children those caregivers preside over.
        It will then join all programs the child is under  

        The groupby could be more efficient, however it seems to be a postgre config issue.

        Age is being cast into a string because the table considers it falsy.
        */ 
        let sql = `
        SELECT
            children.dbkey,
            children.first_name,
            children.last_name,
            COALESCE(children.first_name || ' ' || children.last_name, 'N/A') AS child_name,
            children.assigned_staff_db,
            users.first_name || ' ' || users.last_name AS staff_name,
            users.supervisor_id,
           	programs.program_display_name,
           	children_programs_assigned.enrollment_date,
           	children_programs_assigned.status,
            TO_CHAR(children_programs_assigned.enrollment_date, 'MM/DD/YYYY') AS enrollment_date
        FROM children
        JOIN users
            ON users.dbkey = children.assigned_staff_db
        JOIN children_programs_assigned
            ON children_programs_assigned.child_dbkey = children.dbkey
        JOIN programs
            ON programs.dbkey = children_programs_assigned.program_dbkey
        WHERE users.type = 'caregiver'
            AND users.supervisor_id = $1
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
