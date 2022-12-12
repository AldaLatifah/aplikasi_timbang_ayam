part of 'services.dart';

class HarvestService {
  // Future<Database> init() async {
  //   Directory directory =
  //       await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
  //   final path =
  //       join(directory.path, "timbang_ayam.db"); //create path to database

  //   return await openDatabase(
  //       //open the database or create a database if there isn't any
  //       path,
  //       version: 1, onCreate: (Database db, int version) async {
  //     await db.execute("""
  //         CREATE TABLE periods (
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         name TEXT,
  //         tglawal DATETIME,
  //         tglakhir DATETIME,
  //         id_cage INTEGER)""");
  //   });
  // }

  //  await db.execute("""
  //         CREATE TABLE harvest (
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         name TEXT,
  //         tglPanen DATETIME,
  //         dummytgl DATETIME,
  //         id_cage INTEGER,
  //         id_periode INTEGER)""");
  DBHelper _dbHelper = DBHelper();
  Future<int> addItem(Harvest item) async {
    //returns number of items inserted as an integer

    final db = await _dbHelper.init(); //open database
    final sql =
        '''INSERT INTO harvest(name,tglPanen,dummytgl,id_cage,id_periode) VALUES (?,?,?,?,?)''';
    List<dynamic> params = [
      item.name,
      item.tglPanen,
      item.dummytgl,
      item.id_cage,
      item.id_periode
    ];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<List<Harvest>> fetchMemos() async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final maps = await db
        .query("harvest"); //query all the rows in a table as an array of maps

    List<Harvest> todos = [];
    for (final node in maps) {
      final todo = Harvest.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }

  Future<List<Harvest>> fetchData(int id_cage) async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final sql = '''SELECT * FROM harvest WHERE id_cage = $id_cage''';
    final maps = await db
        .rawQuery(sql); //query all the rows in a table as an array of maps

    List<Harvest> todos = [];
    for (final node in maps) {
      final todo = Harvest.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }
}
