import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper getInstance() => DbHelper._();

  Database? _db;

  Future<Database> getDB() async {
    _db ??= await openDB();

    return _db!;
  }

  Future<Database> openDB() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = join(appDocDir.path, "listDB.db");

    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          "create table blocList ( id integer primary key autoincrement , title text, des text  )");
    });
  }

  Future<bool> addListItem(
      {required String title, required String desc}) async {
    Database db = await getDB();

    int rowEffected =
        await db.insert("blocList", {"title": title, "des": desc});
    return rowEffected > 0;
  }

  Future<bool> updateListItem(
      {required String title, required String desc, required int id}) async {
    Database db = await getDB();

    int rowEffected = await db.update(
      'blocList',
      {'title': title, 'des': desc},
      where: "id=?",
      whereArgs: [id],
    );

    return rowEffected > 0;
  }

  Future<bool> delete({required int id})async{
    Database db= await getDB();
    int rowEffected= await db.delete("blocList", where: 'id=?',whereArgs: [id]);

    return rowEffected>0;
    
  }
  Future<List<Map<String, dynamic>>> fetch() async {
    Database db = await getDB();
    return db.query("blocList");
  }
}
