// File: src/lib/db.js
import mysql from 'mysql2/promise';

export class DatabaseConnector {
  constructor(config) {
    this.config = config;
    this.connection = null;
  }

  async connect() {
    if (!this.connection) {
      this.connection = await mysql.createConnection(this.config);
      console.log('Successfully connected to the database.');
    }
    return this.connection;
  }

  async query(sql, params = []) {
    if (!this.connection) {
      throw new Error('No active database connection. Call "connect()" first.');
    }
    const [rows] = await this.connection.execute(sql, params);
    return rows;
  }

  async close() {
    if (this.connection) {
      await this.connection.end();
      console.log('Database connection closed.');
      this.connection = null;
    }
  }
}
