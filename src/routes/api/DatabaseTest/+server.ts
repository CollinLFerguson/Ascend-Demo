import type { RequestHandler } from './$types';
import { DatabaseConnector } from '$lib/server';
import { json } from '@sveltejs/kit';

export async function POST() {
    const db = new DatabaseConnector();
    try {
      await db.connect();
      const users = await db.query('SELECT * FROM users');
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