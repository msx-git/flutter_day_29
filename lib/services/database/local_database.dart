import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/note.dart';

class LocalDatabase {
  final String tableName = "notes";

  LocalDatabase._();

  static final LocalDatabase _localDatabase = LocalDatabase._();

  factory LocalDatabase() => _localDatabase;

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String dbPath = await getDatabasesPath();
    final path = '$dbPath/$tableName.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    db.execute('''CREATE TABLE $tableName(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    created_date TEXT NOT NULL)''');
  }

  /// Get Contacts
  Future<List<Note>> getNotes() async {
    final db = await _localDatabase.database;
    final list = await db.query(tableName, columns: [
      'id',
      'title',
      'content',
      'created_date',
    ]);
    final notes = list.map((note) => Note.fromJson(note)).toList();
    return notes;
  }

  /// Add Contact
  Future<void> addNote({
    required String title,
    required String content,
    required String createdDate,
  }) async {
    final db = await _localDatabase.database;
    try {
      await db.insert(tableName, {
        'title': title,
        'content': content,
        'created_date': createdDate,
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> editNote({
    required int id,
    required String title,
    required String content,
    required String createdDate,
  }) async {
    final db = await _localDatabase.database;
    db.update(
      tableName,
      {
        'title': title,
        'content': content,
        'created_date': createdDate,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Delete Contact
  Future<void> deleteNote({required int id}) async {
    final db = await _localDatabase.database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
