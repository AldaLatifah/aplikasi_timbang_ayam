part of 'services.dart';

class SppaService {
  // await db.execute("""
  //         CREATE TABLE sppa (
  //         id INTEGER PRIMARY KEY AUTOINCREMENT,
  //         no_sppa TEXT,
  //         peternak TEXT,
  //         customer TEXT,
  //         ekor INTEGER,
  //         kg INTEGER,
  //         alamat TEXT,
  //         no_truk TEXT,
  //         nama_sopir TEXT,
  //         tgl DATETIME,
  //         jam DATETIME,
  //         id_harvest INTEGER)""");
  DBHelper _dbHelper = DBHelper();
  Future<int> addItem(Sppa item) async {
    //returns number of items inserted as an integer

    final db = await _dbHelper.init(); //open database
    final sql =
        '''INSERT INTO sppa(no_sppa, peternak, customer, ekor, kg, alamat, no_truk, nama_sopir, tgl, jam, id_harvest) VALUES (?,?,?,?,?,?,?,?,?,?,?)''';
    List<dynamic> params = [
      item.no_sppa,
      item.peternak,
      item.customer,
      item.ekor,
      item.kg,
      item.alamat,
      item.no_truk,
      item.nama_sopir,
      item.tgl,
      item.jam,
      item.id_harvest
    ];
    final result = await db.rawInsert(sql, params);
    return result;
  }

  Future<List<Sppa>> fetchMemos() async {
    //returns the memos as a list (array)

    final db = await _dbHelper.init();
    final maps = await db
        .query("sppa"); //query all the rows in a table as an array of maps

    List<Sppa> todos = [];
    for (final node in maps) {
      final todo = Sppa.fromMap(node);
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
