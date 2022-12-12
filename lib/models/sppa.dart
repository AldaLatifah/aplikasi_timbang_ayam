part of 'models.dart';

class Sppa {
  late final int _id;
  late final String _nosppa;
  late final String _peternak;
  late final String _customer;
  late final int _ekor;
  late final int _kg;
  late final String _alamat;
  late final String _notruk;
  late final String _namasopir;
  late final String _tgl;
  late final String _jam;
  late final int _idharvest;

  Sppa(
    this._nosppa,
    this._peternak,
    this._customer,
    this._ekor,
    this._kg,
    this._alamat,
    this._notruk,
    this._namasopir,
    this._tgl,
    this._jam,
    this._idharvest,
  );

  Sppa.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nosppa = map['no_sppa'];
    this._peternak = map['peternak'];
    this._customer = map['customer'];
    this._ekor = map['ekor'];
    this._kg = map['kg'];
    this._alamat = map['alamat'];
    this._notruk = map['no_truk'];
    this._namasopir = map['nama_sopir'];
    this._tgl = map['tgl'];
    this._jam = map['jam'];
    this._idharvest = map['id_harvest'];
  }

  int get id => _id;
  String get no_sppa => _nosppa;
  String get peternak => _peternak;
  String get customer => _customer;
  int get ekor => _ekor;
  int get kg => _kg;
  String get alamat => _alamat;
  String get no_truk => _notruk;
  String get nama_sopir => _namasopir;
  String get tgl => _tgl;
  String get jam => _jam;
  int get id_harvest => _idharvest;

  set id(int value) {
    _id = value;
  }

  set no_sppa(String value) {
    _nosppa = value;
  }

  set peternak(String value) {
    _peternak = value;
  }

  set customer(String value) {
    _customer = value;
  }

  set ekor(int value) {
    _ekor = value;
  }

  set kg(int value) {
    _kg = value;
  }

  set alamat(String value) {
    _alamat = value;
  }

  set no_truk(String value) {
    _notruk = value;
  }

  set nama_sopir(String value) {
    _namasopir = value;
  }

  set tgl(String value) {
    _tgl = value;
  }

  set jam(String value) {
    _jam = value;
  }

  set id_harvest(int value) {
    _idharvest = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['no_sppa'] = no_sppa;
    map['peternak'] = peternak;
    map['customer'] = customer;
    map['ekor'] = ekor;
    map['kg'] = kg;
    map['alamat'] = alamat;
    map['no_truk'] = no_truk;
    map['nama_sopir'] = nama_sopir;
    map['tgl'] = tgl;
    map['jam'] = jam;
    map['id_harvest'] = id_harvest;

    return map;
  }
}
