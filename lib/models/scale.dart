part of 'models.dart';

//  id INTEGER PRIMARY KEY AUTOINCREMENT,
//           ekor INTEGER,
//           kg INTEGER,
//           foto TEXT,
//           id_sppa INTEGER)

class Scale {
  late int _id;
  late final int _ekor;
  late final int _kg;
  late final String _foto;
  late final int _idsppa;

  Scale(this._ekor, this._kg, this._foto, this._idsppa);

  Scale.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._ekor = map['ekor'];
    this._kg = map['kg'];
    this._foto = map['foto'];
    this._idsppa = map['id_sppa'];
  }

  int get id => _id;
  int get ekor => _ekor;
  int get kg => _kg;
  String get foto => _foto;
  int get id_sppa => _idsppa;

  set id(int value) {
    _id = value;
  }

  set ekor(int value) {
    _ekor = value;
  }

  set kg(int value) {
    _kg = value;
  }

  set foto(String value) {
    _foto = value;
  }

  set id_sppa(int value) {
    _idsppa = value;
  }

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    // return <String, dynamic>{
    //   "id": id,
    //   "ekor": ekor,
    // };
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['ekor'] = ekor;
    map['kg'] = kg;
    map['foto'] = foto;
    map['id_sppa'] = id_sppa;
    return map;
  }
}
