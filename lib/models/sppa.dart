part of 'models.dart';

class Sppa {
  late final int id;
  late final String name;
  late final String date;

  Sppa({required this.id, required this.name, required this.date});

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "name": name,
      "date": date,
    };
  }
}
