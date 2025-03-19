import 'package:sqflite/sqflite.dart';

class TransactionsTable{
  static Future<void> createTransactionsTable(Database db) async {
    await db.execute('''
    CREATE TABLE transactions (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      sender_id INTEGER NOT NULL,
      receiver_id INTEGER NOT NULL,
      amount REAL NOT NULL,
      date TEXT NOT NULL,
      debt_id INTEGER,
      FOREIGN KEY (sender_id) REFERENCES users (id),
      FOREIGN KEY (receiver_id) REFERENCES users (id),
      FOREIGN KEY (debt_id) REFERENCES debts (id)
    )
  ''');
  }
}