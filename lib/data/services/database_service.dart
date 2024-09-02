import 'dart:io';

import 'package:flutter_colored_print/flutter_colored_print.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

/// A singleton service class for handling SQLite database operations.
class DatabaseService {
  // Private constructor to prevent direct instantiation.
  DatabaseService(this.databaseName);

  final String databaseName;

  // Lazy-initialized database instance.
  Database? _database;

  /// Gets the database instance, initializing it if necessary.
  Future<Database> get database async => _database ??= await _initDatabase();

  /// Initializes and opens the database.
  ///
  /// The database is created if it does not already exist.
  Future<Database> _initDatabase() async {
    // Get the database path.
    final path = await getDBPath();

    // Open the database.
    return openDatabase(
      path,
      onCreate: (db, version) async {
        // Create the initial tables.
        await db.execute('''
          CREATE TABLE month_targets (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT NOT NULL,
            amount double,
            created_at INTEGER DEFAULT (strftime('%s', 'now'))
          )
          ''');

        await db.execute('''
          CREATE TABLE categories (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            color TEXT,
            icon_code_point INTEGER,
            icon_font_family TEXT,
            icon_font_package TEXT,
            icon_match_text_direction BOOLEAN,
            created_at INTEGER DEFAULT (strftime('%s', 'now'))
          )
          ''');
        await db.execute('''
          CREATE TABLE expenses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            date TEXT,
            amount DOUBLE,
            category_id INTEGER,
            created_at INTEGER DEFAULT (strftime('%s', 'now')),
            FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
          )
          ''');

        await db.execute('''
          CREATE TABLE sources (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            color TEXT,
            description TEXT,
            is_received BOOLEAN,
            amount DOUBLE,
            date TEXT,
            created_at INTEGER DEFAULT (strftime('%s', 'now'))
          )
          ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (newVersion == 5) {
          await db.execute('''
            ALTER TABLE month_targets RENAME COLUMN month TO date;
          ''');
          await db.execute('''
            ALTER TABLE month_targets ADD COLUMN description TEXT;
          ''');
        }
      },
      version: 5,
    );
  }

  /// Inserts data into the specified [table].
  ///
  /// If a conflict occurs, the existing row is replaced.
  ///
  /// [table] The name of the table.
  /// [data] The data to insert, as a map of column names to values.
  Future<void> insertData(String table, Map<String, dynamic> data) async {
    if (data.containsKey("created_at") && data["created_at"] == null) {
      data["created_at"] = DateTime.now().millisecondsSinceEpoch;
    }
    final db = await database;
    await db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Deletes data from the specified [table] based on the [id].
  ///
  /// [table] The name of the table.
  /// [id] The ID of the row to delete.
  Future<void> deleteData(String table, int? id) async {
    final db = await database;
    await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Retrieves all data from the specified [table].
  ///
  /// [table] The name of the table.
  ///
  /// Returns a list of maps, each representing a row of data.
  Future<List<Map<String, dynamic>>> getDataList(String table) async {
    final db = await database;
    return await db.query(table);
  }

  /// Updates data in the specified [table] based on the [id].
  ///
  /// [table] The name of the table.
  /// [id] The ID of the row to update.
  /// [data] The new data, as a map of column names to values.
  Future<void> updateData(
      String table, int id, Map<String, dynamic> data) async {
    final db = await database;
    await db.update(
      table,
      data,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> importDatabase(String backupPath) async {
    // Get the database path
    String dbPath = await getDBPath();

    // Copy the backup file to the database location
    await File(backupPath).copy(dbPath);

    return true;
  }

  Future<String> exportDatabase() async {
    // Get the database path
    String dbPath = await getDBPath();

    // Get the documents directory
    await Permission.manageExternalStorage.request();
    Directory? documentsDirectory = await getExternalStorageDirectory();
    String? backupPath = documentsDirectory?.path
        .replaceAll("Android/data/com.alalfy.gpshop/files",
            "gpshop/backups/${DateTime.now().toString()}/$databaseName")
        .replaceAll(':', '-');

    info(backupPath);
    backupPath ??=
        join((await getApplicationDocumentsDirectory()).path, databaseName);

    warn(backupPath);

    if (!Directory(backupPath).existsSync()) {
      Directory(backupPath.replaceFirst("/$databaseName", ""))
          .createSync(recursive: true);
    }

    // Copy the database file to the backup location
    await File(dbPath).copy(backupPath);

    return backupPath;
  }

  Future<String> getDBPath() async {
    await Permission.manageExternalStorage.request();
    Directory? documentsDirectory = await getExternalStorageDirectory();
    String? dbPath = documentsDirectory?.path.replaceAll(
        "Android/data/${await getPackageName()}/files",
        "gpshop/do_not_delete_this/.db/$databaseName");
    primary(dbPath);
    // Get the database path
    var databasesPath = await getDatabasesPath();
    dbPath ??= join(databasesPath, databaseName);
    return dbPath;
  }

  Future<void> truncateAllTables() async {
    final db = await database;
    // Get list of tables
    List<Map<String, dynamic>> tables = await db.rawQuery(
        'SELECT name FROM sqlite_master WHERE type="table" AND name NOT LIKE "sqlite_%"');

    // Truncate all tables
    await _truncateTables(db, tables);

    // Reset auto-increment sequences
    await _resetAutoIncrement(db);
  }

  Future<void> _truncateTables(
      Database db, List<Map<String, dynamic>> tables) async {
    Batch batch = db.batch();
    for (var table in tables) {
      String tableName = table['name'];
      batch.execute('DELETE FROM $tableName');
    }
    await batch.commit();
  }

  Future<void> _resetAutoIncrement(Database db) async {
    await db.execute('DELETE FROM sqlite_sequence');
  }
}
