part of 'services.dart';

class PeriodService {
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

  DBHelper _dbHelper = DBHelper();
  Future<int> addItem(Period item) async {
    //returns number of items inserted as an integer

    final db = await _dbHelper.init(); //open database
    final sql =
        '''INSERT INTO periods(name, tglawal,tglakhir,id_cage) VALUES (?,?,?,?)''';
    List<dynamic> params = [
      item.name,
      item.tglawal,
      item.tglakhir,
      item.id_cage
    ];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<List<Period>> fetchMemos() async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final maps = await db
        .query("periods"); //query all the rows in a table as an array of maps

    List<Period> todos = [];
    for (final node in maps) {
      final todo = Period.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }

  Future<List<Period>> fetchData(int id_cage) async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final sql = '''SELECT * FROM periods WHERE id_cage = $id_cage''';
    final maps = await db
        .rawQuery(sql); //query all the rows in a table as an array of maps

    List<Period> todos = [];
    for (final node in maps) {
      final todo = Period.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }
}
