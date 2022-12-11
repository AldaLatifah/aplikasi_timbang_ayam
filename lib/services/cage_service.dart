part of 'services.dart';

class CageService {
  static const name = 'name';

  DBHelper _dbHelper = DBHelper();

  Future<int> addItem(Cage item) async {
    //returns number of items inserted as an integer

    final db = await _dbHelper.init(); //open database
    final sql = '''INSERT INTO cages(name, lantai) VALUES (?,?)''';
    List<dynamic> params = [item.name, item.lantai];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<List<Cage>> fetchMemos() async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final maps = await db
        .query("cages"); //query all the rows in a table as an array of maps

    List<Cage> todos = [];
    for (final node in maps) {
      final todo = Cage.fromMap(node);
      todos.add(todo);
    }
    return todos;
  }
}
