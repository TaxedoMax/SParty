import 'package:path/path.dart';
import 'package:sparty/core/database/tables/debts_table.dart';
import 'package:sparty/core/database/tables/transactions_table.dart';
import 'package:sparty/core/database/tables/users_table.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider{
  static Database? _database;
  
  static Future<Database> get database async {
    if(_database != null) return _database!;

    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'sparty_db');

    _database = await openDatabase(
        path,
        version: 1,
        onCreate: _createDatabase,
    );

    if(_database == null) throw Exception("Problems with loading database. _database == null.");

    return _database!;
  }

  static Future<void> _createDatabase(Database db, int version) async {
    await UsersTable.createUsersTable(db);
    await DebtsTable.createDebtsTable(db);
    await TransactionsTable.createTransactionsTable(db);
  }
}