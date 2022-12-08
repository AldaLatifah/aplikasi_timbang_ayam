part of 'models.dart';

class Cage {
  late int _id;
  late final String _name;

  Cage(this._name);

  Cage.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
  }

  int get id => _id;
  String get name => _name;

  set id(int value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    // return <String, dynamic>{
    //   "id": id,
    //   "name": name,
    // };
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    return map;
  }
}
