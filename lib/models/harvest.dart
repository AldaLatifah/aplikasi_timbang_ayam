part of 'models.dart';

class Harvest {
  late int _id;
  late final String _name;
  late final String _tglPanen;
  late final String _dummyTgl;
  late final int _idcage;
  late final int _idperiode;

  Harvest(
    this._name,
    this._tglPanen,
    this._dummyTgl,
    this._idcage,
    this._idperiode,
  );

  Harvest.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._tglPanen = map['tglPanen'];
    this._dummyTgl = map['dummytgl'];
    this._idcage = map['id_cage'];
    this._idperiode = map['id_periode'];
  }

  int get id => _id;
  String get name => _name;
  String get tglPanen => _tglPanen;
  String get dummytgl => _dummyTgl;
  int get id_cage => _idcage;
  int get id_periode => _idperiode;

  set id(int value) {
    _id = value;
  }

  set name(String value) {
    _name = value;
  }

  set tglPanen(String value) {
    _tglPanen = value;
  }

  set dummytgl(String value) {
    _dummyTgl = value;
  }

  set id_cage(int value) {
    _idcage = value;
  }

  set id_periode(int value) {
    _idperiode = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['tglPanen'] = tglPanen;
    map['dummytgl'] = dummytgl;
    map['id_cage'] = id_cage;
    map['id_periode'] = id_periode;
    return map;
  }
}
