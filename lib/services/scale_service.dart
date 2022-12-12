part of 'services.dart';

class ScaleService {
  // await db.execute("""
  //         CREATE TABLE detail_scale (
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         ekor INTEGER,
  //         kg INTEGER,
  //         foto TEXT,
  //         id_sppa INTEGER)""");

  DBHelper _dbHelper = DBHelper();
  Future<int> addItem(Scale item) async {
    //returns number of items inserted as an integer

    final db = await _dbHelper.init(); //open database
    final sql =
        '''INSERT INTO detail_scale(ekor, kg,foto,id_sppa) VALUES (?,?,?,?)''';
    List<dynamic> params = [item.ekor, item.kg, item.foto, item.id_sppa];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<List<Scale>> fetchMemos() async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final maps = await db.query(
        "detail_scale"); //query all the rows in a table as an array of maps

    List<Scale> todos = [];
    for (final node in maps) {
      final todo = Scale.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }

  Future<List<Scale>> fetchData(int id_sppa) async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final sql = '''SELECT * FROM detail_scale WHERE id_sppa = $id_sppa''';
    final maps = await db
        .rawQuery(sql); //query all the rows in a table as an array of maps

    List<Scale> todos = [];
    for (final node in maps) {
      final todo = Scale.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }
}
