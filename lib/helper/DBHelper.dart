import 'dart:io';

import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths

class DBHelper {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path =
        join(directory.path, "timbang_ayam.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE cages (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          lantai TEXT)""");
      await db.execute("""
          CREATE TABLE periods (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT,
          tglawal DATETIME,
          tglakhir DATETIME,
          id_cage INTEGER)""");
    });
  }
}
