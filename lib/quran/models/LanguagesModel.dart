import 'dart:convert';
/// languages : [{"id":38,"name":"English","iso_code":"en","native_name":"English","direction":"ltr","translations_count":19,"translated_name":{"name":"English","language_name":"english"}},{"id":174,"name":"Urdu","iso_code":"ur","native_name":"اردو","direction":"rtl","translations_count":7,"translated_name":{"name":"Urdu","language_name":"english"}},{"id":20,"name":"Bengali","iso_code":"bn","native_name":"বাংলা","direction":"ltr","translations_count":7,"translated_name":{"name":"Bengali","language_name":"english"}},{"id":167,"name":"Turkish","iso_code":"tr","native_name":"Türkçe","direction":"ltr","translations_count":6,"translated_name":{"name":"Turkish","language_name":"english"}},{"id":40,"name":"Spanish","iso_code":"es","native_name":"Español","direction":"ltr","translations_count":5,"translated_name":{"name":"Spanish","language_name":"english"}},{"id":106,"name":"Malayalam","iso_code":"ml","native_name":"മലയാളം","direction":"ltr","translations_count":4,"translated_name":{"name":"Malayalam","language_name":"english"}},{"id":49,"name":"French","iso_code":"fr","native_name":"Français","direction":"ltr","translations_count":4,"translated_name":{"name":"French","language_name":"english"}},{"id":138,"name":"Russian","iso_code":"ru","native_name":"Русский","direction":"ltr","translations_count":4,"translated_name":{"name":"Russian","language_name":"english"}},{"id":23,"name":"Bosnian","iso_code":"bs","native_name":"Bosanski","direction":"ltr","translations_count":4,"translated_name":{"name":"Bosnian","language_name":"english"}},{"id":33,"name":"German","iso_code":"de","native_name":"Deutsch","direction":"ltr","translations_count":3,"translated_name":{"name":"German","language_name":"english"}},{"id":118,"name":"Dutch","iso_code":"nl","native_name":"Nederlands","direction":"ltr","translations_count":3,"translated_name":{"name":"Dutch","language_name":"english"}},{"id":160,"name":"Tajik","iso_code":"tg","native_name":"","direction":"ltr","translations_count":3,"translated_name":{"name":"Tajik","language_name":"english"}},{"id":67,"name":"Indonesian","iso_code":"id","native_name":"Bahasa Indonesia","direction":"ltr","translations_count":3,"translated_name":{"name":"Indonesian","language_name":"english"}},{"id":74,"name":"Italian","iso_code":"it","native_name":"Italiano","direction":"ltr","translations_count":3,"translated_name":{"name":"Italian","language_name":"english"}},{"id":76,"name":"Japanese","iso_code":"ja","native_name":"日本語","direction":"ltr","translations_count":3,"translated_name":{"name":"Japanese","language_name":"english"}},{"id":175,"name":"Uzbek","iso_code":"uz","native_name":"","direction":"ltr","translations_count":3,"translated_name":{"name":"Uzbek","language_name":"english"}},{"id":177,"name":"Vietnamese","iso_code":"vi","native_name":"Tiếng Việt","direction":"ltr","translations_count":3,"translated_name":{"name":"Vietnamese","language_name":"english"}},{"id":185,"name":"Chinese","iso_code":"zh","native_name":"中文","direction":"ltr","translations_count":3,"translated_name":{"name":"Chinese","language_name":"english"}},{"id":187,"name":"Albanian","iso_code":"sq","native_name":"Shqip","direction":"ltr","translations_count":3,"translated_name":{"name":"Albanian","language_name":"english"}},{"id":158,"name":"Tamil","iso_code":"ta","native_name":"தமிழ்","direction":"ltr","translations_count":3,"translated_name":{"name":"Tamil","language_name":"english"}},{"id":110,"name":"Malay","iso_code":"ms","native_name":"Bahasa Melayu","direction":"ltr","translations_count":2,"translated_name":{"name":"Malay","language_name":"english"}},{"id":19,"name":"Bambara","iso_code":"bm","native_name":"","direction":"ltr","translations_count":2,"translated_name":{"name":"Bambara","language_name":"english"}},{"id":58,"name":"Hausa","iso_code":"ha","native_name":"","direction":"ltr","translations_count":2,"translated_name":{"name":"Hausa","language_name":"english"}},{"id":133,"name":"Portuguese","iso_code":"pt","native_name":"Português","direction":"ltr","translations_count":2,"translated_name":{"name":"Portuguese","language_name":"english"}},{"id":137,"name":"Romanian","iso_code":"ro","native_name":"Română","direction":"ltr","translations_count":2,"translated_name":{"name":"Romanian","language_name":"english"}},{"id":60,"name":"Hindi","iso_code":"hi","native_name":"हिन्दी","direction":"ltr","translations_count":2,"translated_name":{"name":"Hindi","language_name":"english"}},{"id":10,"name":"Assamese","iso_code":"as","native_name":"অসমীয়া","direction":"ltr","translations_count":2,"translated_name":{"name":"Assamese","language_name":"english"}},{"id":82,"name":"Kazakh","iso_code":"kk","native_name":"Қазақ","direction":"ltr","translations_count":2,"translated_name":{"name":"Kazakh","language_name":"english"}},{"id":157,"name":"Swahili","iso_code":"sw","native_name":"Kiswahili","direction":"ltr","translations_count":2,"translated_name":{"name":"Swahili","language_name":"english"}},{"id":84,"name":"Central Khmer","iso_code":"km","native_name":"","direction":"ltr","translations_count":2,"translated_name":{"name":"Central Khmer","language_name":"english"}},{"id":161,"name":"Thai","iso_code":"th","native_name":"ภาษาไทย","direction":"ltr","translations_count":2,"translated_name":{"name":"Thai","language_name":"english"}},{"id":164,"name":"Tagalog","iso_code":"tl","native_name":"","direction":"ltr","translations_count":2,"translated_name":{"name":"Tagalog","language_name":"english"}},{"id":13,"name":"Azeri","iso_code":"az","native_name":"Azərbaycan dili","direction":"ltr","translations_count":2,"translated_name":{"name":"Azeri","language_name":"english"}},{"id":86,"name":"Korean","iso_code":"ko","native_name":"한국어","direction":"ltr","translations_count":2,"translated_name":{"name":"Korean","language_name":"english"}},{"id":89,"name":"Kurdish","iso_code":"ku","native_name":"Kurdî","direction":"ltr","translations_count":2,"translated_name":{"name":"Kurdish","language_name":"english"}},{"id":150,"name":"Somali","iso_code":"so","native_name":"","direction":"ltr","translations_count":2,"translated_name":{"name":"Somali","language_name":"english"}},{"id":16,"name":"Bulgarian","iso_code":"bg","native_name":"Български","direction":"ltr","translations_count":2,"translated_name":{"name":"Bulgarian","language_name":"english"}},{"id":43,"name":"Persian","iso_code":"fa","native_name":"فارسی","direction":"rtl","translations_count":2,"translated_name":{"name":"Persian","language_name":"english"}},{"id":169,"name":"Tatar","iso_code":"tt","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Tatar","language_name":"english"}},{"id":188,"name":"Amazigh","iso_code":"zgh","native_name":"Tamaziɣt","direction":"ltr","translations_count":1,"translated_name":{"name":"Amazigh","language_name":"english"}},{"id":190,"name":"Dari","iso_code":"prs","native_name":"دری","direction":"rtl","translations_count":1,"translated_name":{"name":"Dari","language_name":"english"}},{"id":6,"name":"Amharic","iso_code":"am","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Amharic","language_name":"english"}},{"id":25,"name":"Chechen","iso_code":"ce","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Chechen","language_name":"english"}},{"id":29,"name":"Czech","iso_code":"cs","native_name":"Čeština","direction":"ltr","translations_count":1,"translated_name":{"name":"Czech","language_name":"english"}},{"id":34,"name":"Divehi, Dhivehi, Maldivian","iso_code":"dv","native_name":"ދިވެހި","direction":"ltr","translations_count":1,"translated_name":{"name":"Divehi, Dhivehi, Maldivian","language_name":"english"}},{"id":45,"name":"Finnish","iso_code":"fi","native_name":"Suomi","direction":"ltr","translations_count":1,"translated_name":{"name":"Finnish","language_name":"english"}},{"id":56,"name":"Gujarati","iso_code":"gu","native_name":"ગુજરાતી","direction":"ltr","translations_count":1,"translated_name":{"name":"Gujarati","language_name":"english"}},{"id":59,"name":"Hebrew","iso_code":"he","native_name":"עברית","direction":"rtl","translations_count":1,"translated_name":{"name":"Hebrew","language_name":"english"}},{"id":78,"name":"Georgian","iso_code":"ka","native_name":"ქართული","direction":"ltr","translations_count":1,"translated_name":{"name":"Georgian","language_name":"english"}},{"id":85,"name":"Kannada","iso_code":"kn","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Kannada","language_name":"english"}},{"id":95,"name":"Ganda","iso_code":"lg","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Ganda","language_name":"english"}},{"id":105,"name":"Macedonian","iso_code":"mk","native_name":"Македонски","direction":"ltr","translations_count":1,"translated_name":{"name":"Macedonian","language_name":"english"}},{"id":108,"name":"Marathi","iso_code":"mr","native_name":"मराठी","direction":"ltr","translations_count":1,"translated_name":{"name":"Marathi","language_name":"english"}},{"id":109,"name":"Maranao","iso_code":"mrn","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Maranao","language_name":"english"}},{"id":116,"name":"Nepali","iso_code":"ne","native_name":"नेपाली","direction":"ltr","translations_count":1,"translated_name":{"name":"Nepali","language_name":"english"}},{"id":120,"name":"Norwegian","iso_code":"no","native_name":"Norsk","direction":"ltr","translations_count":1,"translated_name":{"name":"Norwegian","language_name":"english"}},{"id":126,"name":"Oromo","iso_code":"om","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Oromo","language_name":"english"}},{"id":131,"name":"Polish","iso_code":"pl","native_name":"Polski","direction":"ltr","translations_count":1,"translated_name":{"name":"Polish","language_name":"english"}},{"id":132,"name":"Pashto","iso_code":"ps","native_name":"پښتو","direction":"rtl","translations_count":1,"translated_name":{"name":"Pashto","language_name":"english"}},{"id":139,"name":"Kinyarwanda","iso_code":"rw","native_name":"Ikinyarwanda","direction":"ltr","translations_count":1,"translated_name":{"name":"Kinyarwanda","language_name":"english"}},{"id":142,"name":"Sindhi","iso_code":"sd","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Sindhi","language_name":"english"}},{"id":143,"name":"Northern Sami","iso_code":"se","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Northern Sami","language_name":"english"}},{"id":145,"name":"Sinhala, Sinhalese","iso_code":"si","native_name":"සිංහල","direction":"ltr","translations_count":1,"translated_name":{"name":"Sinhala, Sinhalese","language_name":"english"}},{"id":152,"name":"Serbian","iso_code":"sr","native_name":"Српски","direction":"ltr","translations_count":1,"translated_name":{"name":"Serbian","language_name":"english"}},{"id":151,"name":"Albanian","iso_code":"sq","native_name":"Shqip","direction":"ltr","translations_count":1,"translated_name":{"name":"Albanian","language_name":"english"}},{"id":156,"name":"Swedish","iso_code":"sv","native_name":"Svenska","direction":"ltr","translations_count":1,"translated_name":{"name":"Swedish","language_name":"english"}},{"id":159,"name":"Telugu","iso_code":"te","native_name":"తెలుగు","direction":"ltr","translations_count":1,"translated_name":{"name":"Telugu","language_name":"english"}},{"id":183,"name":"Yoruba","iso_code":"yo","native_name":"","direction":"ltr","translations_count":1,"translated_name":{"name":"Yoruba","language_name":"english"}},{"id":172,"name":"Uighur, Uyghur","iso_code":"ug","native_name":"","direction":"rtl","translations_count":1,"translated_name":{"name":"Uighur, Uyghur","language_name":"english"}},{"id":173,"name":"Ukrainian","iso_code":"uk","native_name":"Українська","direction":"ltr","translations_count":1,"translated_name":{"name":"Ukrainian","language_name":"english"}}]

LanguagesModel languagesModelFromJson(String str) => LanguagesModel.fromJson(json.decode(str));
String languagesModelToJson(LanguagesModel data) => json.encode(data.toJson());
class LanguagesModel {
  LanguagesModel({
      List<Languages>? languages,}){
    _languages = languages;
}

  LanguagesModel.fromJson(dynamic json) {
    if (json['languages'] != null) {
      _languages = [];
      json['languages'].forEach((v) {
        _languages?.add(Languages.fromJson(v));
      });
    }
  }
  List<Languages>? _languages;
LanguagesModel copyWith({  List<Languages>? languages,
}) => LanguagesModel(  languages: languages ?? _languages,
);
  List<Languages>? get languages => _languages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_languages != null) {
      map['languages'] = _languages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 38
/// name : "English"
/// iso_code : "en"
/// native_name : "English"
/// direction : "ltr"
/// translations_count : 19
/// translated_name : {"name":"English","language_name":"english"}

Languages languagesFromJson(String str) => Languages.fromJson(json.decode(str));
String languagesToJson(Languages data) => json.encode(data.toJson());
class Languages {
  Languages({
      num? id, 
      String? name, 
      String? isoCode, 
      String? nativeName, 
      String? direction, 
      num? translationsCount, 
      TranslatedName? translatedName,}){
    _id = id;
    _name = name;
    _isoCode = isoCode;
    _nativeName = nativeName;
    _direction = direction;
    _translationsCount = translationsCount;
    _translatedName = translatedName;
}

  Languages.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _isoCode = json['iso_code'];
    _nativeName = json['native_name'];
    _direction = json['direction'];
    _translationsCount = json['translations_count'];
    _translatedName = json['translated_name'] != null ? TranslatedName.fromJson(json['translated_name']) : null;
  }
  num? _id;
  String? _name;
  String? _isoCode;
  String? _nativeName;
  String? _direction;
  num? _translationsCount;
  TranslatedName? _translatedName;
Languages copyWith({  num? id,
  String? name,
  String? isoCode,
  String? nativeName,
  String? direction,
  num? translationsCount,
  TranslatedName? translatedName,
}) => Languages(  id: id ?? _id,
  name: name ?? _name,
  isoCode: isoCode ?? _isoCode,
  nativeName: nativeName ?? _nativeName,
  direction: direction ?? _direction,
  translationsCount: translationsCount ?? _translationsCount,
  translatedName: translatedName ?? _translatedName,
);
  num? get id => _id;
  String? get name => _name;
  String? get isoCode => _isoCode;
  String? get nativeName => _nativeName;
  String? get direction => _direction;
  num? get translationsCount => _translationsCount;
  TranslatedName? get translatedName => _translatedName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['iso_code'] = _isoCode;
    map['native_name'] = _nativeName;
    map['direction'] = _direction;
    map['translations_count'] = _translationsCount;
    if (_translatedName != null) {
      map['translated_name'] = _translatedName?.toJson();
    }
    return map;
  }

}

/// name : "English"
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