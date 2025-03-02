import type { RequestHandler } from './$types';
//import { DatabaseConnector } from '$lib';

export async function GET() {
    const db = new DatabaseConnector();
    try {
      await db.connect();
      const users = await db.query('SELECT * FROM users');
      return json({ users });
    } catch (error) {
      console.error('Database error:', error);
      return new Response(
        JSON.stringify({ error: 'Database query failed' }),
        { status: 500 }
      );
    } finally {
      await db.close();
    }
  }