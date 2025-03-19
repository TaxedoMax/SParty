import 'package:sqflite/sqflite.dart';

class UsersTable{
  static Future<void> createUsersTable(Database db) async {
    await db.execute('''
    CREATE TABLE users (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      phone_number TEXT UNIQUE NOT NULL,
      name TEXT
    )
  ''');
  }
}