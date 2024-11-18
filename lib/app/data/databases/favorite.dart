import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  DatabaseManager._private();

  static final DatabaseManager instance = DatabaseManager._private();

  Database? _db;

  Future<Database> get db async {
    _db ??= await _initDB();
    return _db!;
  }

  Future _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, "favorite.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
            CREATE TABLE favorite (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              username TEXT,
              name TEXT,
              avatarUrl TEXT,
              email TEXT,
              location TEXT,
              company TEXT
            )
          ''');
      },
    );
  }

  Future<int> addFavorite(Map<String, dynamic> user) async {
    final db = await this.db;
    return await db.insert('favorite', user);
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await this.db;
    return await db.query('favorite');
  }

  Future<int> deleteFavorite(String username) async {
    final db = await this.db;
    return await db.delete(
      'favorite',
      where: 'username = ?',
      whereArgs: [username],
    );
  }

  Future<void> closeDB() async {
    final db = await instance.db;
    db.close();
  }
}
