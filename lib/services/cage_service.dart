part of 'services.dart';

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

Future<int> addItem(Cage item) async {
  //returns number of items inserted as an integer

  final db = await init(); //open database

  return db.insert(
    "cages", item.toMap(), //toMap() function from MemoModel
    conflictAlgorithm:
        ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
  );
}

// Future<List<Cage>> fetchMemos() async {
//   //returns the memos as a list (array)

//   final db = await init();
//   final maps = await db.query(
//       "timbang_ayam"); //query all the rows in a table as an array of maps

//   // return List.generate(maps.length, (i) {
//   //   //create a list of memos
//   //   return Cage(id: maps[i]['id'] ?? '', name: maps[i]['title'] ?? '');
//   // });
// }
