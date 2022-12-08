part of 'models.dart';

class Cage {
  late final int id;
  late final String name;

  Cage({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "name": name,
    };
  }
}
