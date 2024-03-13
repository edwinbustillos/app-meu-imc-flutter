import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'dart:async';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Future<Database>? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = setDB();
    return _db!;
  }

  Future<Database> setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'imc.db');
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE imc(id INTEGER PRIMARY KEY, nome TEXT, imc TEXT, resultado TEXT)');
  }

  Future<int> saveIMC(String nome, String imc, String resultado) async {
    var dbClient = await db;
    int res = await dbClient.rawInsert(
        'INSERT INTO imc(nome, imc, resultado) VALUES(?, ?, ?)',
        [nome, imc, resultado]);
    return res;
  }

  Future<List<Map>> getIMCs() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM imc');
    return list;
  }

  Future<int> deleteIMC(int id) async {
    var dbClient = await db;
    return await dbClient.rawDelete('DELETE FROM imc WHERE id = ?', [id]);
  }
}
