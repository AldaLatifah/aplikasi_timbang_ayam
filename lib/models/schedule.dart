part of 'models.dart';

class Schedule {
  late final int id;
  late final String name;
  late final String date;
  late final int id_cage;

  Schedule(
      {required this.id,
      required this.name,
      required this.date,
      required this.id_cage});

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "name": name,
      "date": date,
      "id_cage": id_cage
    };
  }
}
