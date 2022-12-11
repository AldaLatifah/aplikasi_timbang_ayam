part of 'models.dart';

class Period {
  late int _id;
  late final String _name;
  late final String _tglawal;
  late final String _tglakhir;
  late final int _idcage;

  Period(this._name, this._tglawal, this._tglakhir, this._idcage);

  Period.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._tglawal = map['tglawal'];
    this._tglakhir = map['tglakhir'];
    this._idcage = map['id_cage'];
  }

  int get id => _id;
  String get name => _name;
  String get tglawal => _tglawal;
  String get tglakhir => _tglakhir;
  int get id_cage => _idcage;

  set id(int value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set tglawal(String value) {
    _tglawal = value;
  }

  set tglakhir(String value) {
    _tglakhir = value;
  }

  set id_cage(int value) {
    _idcage = value;
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
    map['tglawal'] = tglawal;
    map['tglakhir'] = tglakhir;
    map['id_cage'] = id_cage;
    return map;
  }
}
