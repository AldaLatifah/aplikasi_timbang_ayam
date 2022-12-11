part of 'models.dart';

class Cage {
  late int _id;
  late final String _name;
  late final String _lantai;

  Cage(this._name, this._lantai);

  Cage.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._lantai = map['lantai'];
  }

  int get id => _id;
  String get name => _name;
  String get lantai => _lantai;

  set id(int value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set lantai(String value) {
    _lantai = value;
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
    map['lantai'] = lantai;
    return map;
  }
}
