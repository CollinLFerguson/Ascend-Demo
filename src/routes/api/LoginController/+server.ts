import { json } from '@sveltejs/kit';
import { DatabaseConnector } from '$lib/server';


export async function POST({ request, cookies }) {
    //password is here for stub purposes. A proper auth process has not been implemented.
    const { username, password } = await request.json();
    try{
    
        const response = await databaseFetch(username);
        if (!response.ok) throw new Error("Databast failed");

        const data = await response.json();

        console.log(data)
                
        let user = data.users[0];

        if (user) {
            const sessionToken = 'fake-session-token'; // Normally a JWT or session ID

            // Set the authentication cookie
            cookies.set('auth_token', sessionToken, {
                httpOnly: true,  // Prevent JavaScript access (XSS protection)
                secure: false,    // Send only over HTTPS
                sameSite: 'strict', // CSRF protection
                path: '/',       // Accessible across the site
                maxAge: 60 * 60 * 24 // 1 day
            });

            return json({ success: true, user: user, token:sessionToken});
        }

        return json({ success: false, error: 'Invalid credentials' }, { status: 401 });
        
        } catch (error) {
            console.error('Login error:', error);
            return new Response(
            JSON.stringify({ success: false, error: 'Login Process Failed: ' + error }),
            { status: 500 }
        );
    }
}


async function databaseFetch(id: number){
    //There is 100% a more elegant way to do this.

    let sql = ` 
        WITH filtered_users AS (
    SELECT 
        u.*, 
        (u.first_name || ' ' || u.last_name) AS name
    FROM users u
    WHERE u.dbkey = $1)
    SELECT 
        fu.*, 
        COALESCE(s.first_name || ' ' || s.last_name, 'N/A') AS supervisor_name,
        p.program_name,
        p.program_display_name
        FROM filtered_users fu
        LEFT JOIN users s ON fu.supervisor_id = s.dbkey
        LEFT JOIN programs p ON fu.program = p.dbkey;
    `


    const db = new DatabaseConnector();
    try{
        console.log(sql) 
        //return
        let params = [id]
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

}