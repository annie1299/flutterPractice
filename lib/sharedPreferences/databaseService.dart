import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'randomNumber.dart';

final tableRandomNumber = "randoms";

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  Future<Database> database;
  factory DatabaseService() {
    return _instance;
  }

  DatabaseService._internal() {
    initDatabase();
  }

  initDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'mydb.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableRandomNumber(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            value INTEGER,
            createdTime DATETIME)
          ''',
        );
      },
      version: 1,
    );
  }

  Future<int> insertNumber(RandomNumber number) async {
    Database db = await database;
    int id = await db.insert(tableRandomNumber, number.toMap());
    return id;
  }

  Future<RandomNumber> getNumber(int id) async {
    Database db = await database;
    List<Map> datas =
        await db.query(tableRandomNumber, where: 'id = ?', whereArgs: [id]);
    if (datas.length > 0) {
      return RandomNumber.fromMap(datas.first);
    }
    return null;
  }
}
