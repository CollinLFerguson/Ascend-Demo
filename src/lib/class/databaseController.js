// File: src/lib/db.js
import { Client } from 'pg';
import dotenv from 'dotenv';
dotenv.config();
/*
Simple database controller. 
Pulls in database info from the .env file found in the root directory.
This must be configured in order to make the connection.
*/
export class DatabaseConnector {
  constructor() {
    // Optional: accept `config` in the constructor so you can override defaults.
    // Otherwise, you can just use environment variables directly.
    this.config = {
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      port: process.env.DB_PORT
    };
    this.client = null;
  }

  async connect() {
    if (!this.client) {
      this.client = new Client(this.config);
      await this.client.connect();
      console.log('Successfully connected to the Postgres database.');
    }
    return this.client;
  }

  /**
   * @param {string} sql
   */
  // @ts-ignore
  async query(sql, params = []) {
    if (!this.client) {
      throw new Error('No active database connection. Call "connect()" first.');
    }
    // The pg client returns an object with `rows`, `fields`, etc.
    const result = await this.client.query(sql, params);
    return result.rows; // Return only the rows if that's all you need
  }

  async close() {
    if (this.client) {
      await this.client.end();
      console.log('Postgres database connection closed.');
      this.client = null;
    }
  }
}
