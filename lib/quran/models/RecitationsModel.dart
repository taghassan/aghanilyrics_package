import 'dart:convert';
/// recitations : [{"id":2,"reciter_name":"AbdulBaset AbdulSamad","style":"Murattal","translated_name":{"name":"AbdulBaset AbdulSamad","language_name":"english"}},{"id":1,"reciter_name":"AbdulBaset AbdulSamad","style":"Mujawwad","translated_name":{"name":"AbdulBaset AbdulSamad","language_name":"english"}},{"id":3,"reciter_name":"Abdur-Rahman as-Sudais","style":null,"translated_name":{"name":"Abdur-Rahman as-Sudais","language_name":"english"}},{"id":4,"reciter_name":"Abu Bakr al-Shatri","style":null,"translated_name":{"name":"Abu Bakr al-Shatri","language_name":"english"}},{"id":5,"reciter_name":"Hani ar-Rifai","style":null,"translated_name":{"name":"Hani ar-Rifai","language_name":"english"}},{"id":12,"reciter_name":"Mahmoud Khalil Al-Husary","style":"Muallim","translated_name":{"name":"Mahmoud Khalil Al-Husary","language_name":"english"}},{"id":6,"reciter_name":"Mahmoud Khalil Al-Husary","style":null,"translated_name":{"name":"Mahmoud Khalil Al-Husary","language_name":"english"}},{"id":7,"reciter_name":"Mishari Rashid al-`Afasy","style":null,"translated_name":{"name":"Mishari Rashid al-`Afasy","language_name":"english"}},{"id":9,"reciter_name":"Mohamed Siddiq al-Minshawi","style":"Murattal","translated_name":{"name":"Mohamed Siddiq al-Minshawi","language_name":"english"}},{"id":8,"reciter_name":"Mohamed Siddiq al-Minshawi","style":"Mujawwad","translated_name":{"name":"Mohamed Siddiq al-Minshawi","language_name":"english"}},{"id":10,"reciter_name":"Sa`ud ash-Shuraym","style":null,"translated_name":{"name":"Sa`ud ash-Shuraym","language_name":"english"}},{"id":11,"reciter_name":"Mohamed al-Tablawi","style":null,"translated_name":{"name":"Mohamed al-Tablawi","language_name":"english"}}]

RecitationsModel recitationsModelFromJson(String str) => RecitationsModel.fromJson(json.decode(str));
String recitationsModelToJson(RecitationsModel data) => json.encode(data.toJson());
class RecitationsModel {
  RecitationsModel({
      List<Recitations>? recitations,}){
    _recitations = recitations;
}

  RecitationsModel.fromJson(dynamic json) {
    if (json['recitations'] != null) {
      _recitations = [];
      json['recitations'].forEach((v) {
        _recitations?.add(Recitations.fromJson(v));
      });
    }
  }
  List<Recitations>? _recitations;
RecitationsModel copyWith({  List<Recitations>? recitations,
}) => RecitationsModel(  recitations: recitations ?? _recitations,
);
  List<Recitations>? get recitations => _recitations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_recitations != null) {
      map['recitations'] = _recitations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// reciter_name : "AbdulBaset AbdulSamad"
/// style : "Murattal"
/// translated_name : {"name":"AbdulBaset AbdulSamad","language_name":"english"}

Recitations recitationsFromJson(String str) => Recitations.fromJson(json.decode(str));
String recitationsToJson(Recitations data) => json.encode(data.toJson());
class Recitations {
  Recitations({
      num? id, 
      String? reciterName, 
      String? style, 
      TranslatedName? translatedName,}){
    _id = id;
    _reciterName = reciterName;
    _style = style;
    _translatedName = translatedName;
}

  Recitations.fromJson(dynamic json) {
    _id = json['id'];
    _reciterName = json['reciter_name'];
    _style = json['style'];
    _translatedName = json['translated_name'] != null ? TranslatedName.fromJson(json['translated_name']) : null;
  }
  num? _id;
  String? _reciterName;
  String? _style;
  TranslatedName? _translatedName;
Recitations copyWith({  num? id,
  String? reciterName,
  String? style,
  TranslatedName? translatedName,
}) => Recitations(  id: id ?? _id,
  reciterName: reciterName ?? _reciterName,
  style: style ?? _style,
  translatedName: translatedName ?? _translatedName,
);
  num? get id => _id;
  String? get reciterName => _reciterName;
  String? get style => _style;
  TranslatedName? get translatedName => _translatedName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['reciter_name'] = _reciterName;
    map['style'] = _style;
    if (_translatedName != null) {
      map['translated_name'] = _translatedName?.toJson();
    }
    return map;
  }

}

/// name : "AbdulBaset AbdulSamad"
/// language_name : "english"

TranslatedName translatedNameFromJson(String str) => TranslatedName.fromJson(json.decode(str));
String translatedNameToJson(TranslatedName data) => json.encode(data.toJson());
class TranslatedName {
  TranslatedName({
      String? name, 
      String? languageName,}){
    _name = name;
    _languageName = languageName;
}

  TranslatedName.fromJson(dynamic json) {
    _name = json['name'];
    _languageName = json['language_name'];
  }
  String? _name;
  String? _languageName;
TranslatedName copyWith({  String? name,
  String? languageName,
}) => TranslatedName(  name: name ?? _name,
  languageName: languageName ?? _languageName,
);
  String? get name => _name;
  String? get languageName => _languageName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['language_name'] = _languageName;
    return map;
  }

}