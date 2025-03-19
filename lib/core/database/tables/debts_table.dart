import 'package:sqflite/sqflite.dart';

class DebtsTable{
  static Future<void> createDebtsTable(Database db) async {
    await db.execute('''
    CREATE TABLE debts (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      creditor_id INTEGER NOT NULL,
      debtor_id INTEGER NOT NULL,
      amount REAL NOT NULL,
      description TEXT,
      date TEXT NOT NULL,
      FOREIGN KEY (creditor_id) REFERENCES users (id),
      FOREIGN KEY (debtor_id) REFERENCES users (id)
    )
  ''');
  }
}