import type { RequestHandler } from './$types';
import { DatabaseConnector } from '$lib/server';
import { json } from '@sveltejs/kit';

export async function POST({request}) {
    const db = new DatabaseConnector();
    try {

      const requestBody = await request.json();

      await db.connect();
      const users = await db.query('SELECT * FROM users WHERE users.dbkey=1');
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

  