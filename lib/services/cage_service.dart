part of 'services.dart';

class CageService {
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
          name TEXT)""");
    });
  }

  static const name = 'name';

  Future<int> addItem(Cage item) async {
    //returns number of items inserted as an integer

    final db = await init(); //open database
    final sql = '''INSERT INTO cages(name) VALUES (?)''';
    List<dynamic> params = [item.name];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<List<Cage>> fetchMemos() async {
    //returns the memos as a list (array)

    final db = await init();
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
