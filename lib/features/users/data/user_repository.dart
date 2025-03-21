import 'package:sparty/core/database/database.dart';
import 'package:sqflite/sqflite.dart';

import '../../../core/database/models/user.dart';

class UserRepository{
  Future<Database> get _db async {
    return await DBProvider.database;
  }

  Future<int> createUser(User user) async {
    final db = await _db;
    return await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore, // Игнорируем дубликаты номеров
    );
  }

  /// **Получение пользователя по ID**
  Future<User?> getUserById(int id) async {
    final db = await _db;
    final List<Map<String, dynamic>> maps =
    await db.query('users', where: 'id = ?', whereArgs: [id]);

    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null; // Если пользователя нет
  }

  /// **Получение всех пользователей**
  Future<List<User>> getAllUsers() async {
    final db = await _db;
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) => User.fromMap(maps[i]));
  }

  /// **Обновление пользователя**
  Future<int> updateUser(User user) async {
    final db = await _db;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  /// **Удаление пользователя**
  Future<int> deleteUser(int id) async {
    final db = await _db;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}