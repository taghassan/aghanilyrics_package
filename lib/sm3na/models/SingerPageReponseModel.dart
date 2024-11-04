import 'dart:convert';
/// section_title : "أ"
/// links : [{"title":"اغاني أحمد الصادق","href":"https://www.sm3na.com/audios/c6938f52cb"},{"title":"اغاني أحمد المصطفى","href":"https://www.sm3na.com/audios/27dcd0980f"},{"title":"اغاني أبو عركى البخيت","href":"https://www.sm3na.com/audios/d8f0efa196"},{"title":"اغاني ابراهيم عوض","href":"https://www.sm3na.com/audios/b2db54d55b"},{"title":"اغاني أحمد الجابري","href":"https://www.sm3na.com/audios/764c8e3a69"},{"title":"اغاني إنصاف مدني","href":"https://www.sm3na.com/audios/0b520d281c"},{"title":"اغاني احمد امين","href":"https://www.sm3na.com/audios/0f5d846393"},{"title":"اغاني الأمين عبد الغفار","href":"https://www.sm3na.com/audios/02b71c593d"},{"title":"اغاني إيمان وأماني","href":"https://www.sm3na.com/audios/851b001644"},{"title":"اغاني ابراهيم الكاشف","href":"https://www.sm3na.com/audios/33aba05126"},{"title":"اغاني ايلاف عبدالعزيز","href":"https://www.sm3na.com/audios/be596a51fb"},{"title":"اغاني البلابل","href":"https://www.sm3na.com/audios/808006ce95"},{"title":"اغاني اسماعيل حسب الدائم","href":"https://www.sm3na.com/audios/9414de3ebd"},{"title":"اغاني ايمان الشريف ","href":"https://www.sm3na.com/audios/406598587a"},{"title":"اغاني أسرار بابكر","href":"https://www.sm3na.com/audios/92d1b0e196"},{"title":"اغاني احمد فتح الله","href":"https://www.sm3na.com/audios/bff398787c"},{"title":"اغاني العاقب محمد حسن","href":"https://www.sm3na.com/audios/bd392b120b"},{"title":"اغاني اكرام بت العز","href":"https://www.sm3na.com/audios/3b03ae6d3f"},{"title":"اغاني ابراهيم حسين","href":"https://www.sm3na.com/audios/7b24303ee6"},{"title":"اغاني التاج مصطفى","href":"https://www.sm3na.com/audios/c2d7d2fec5"},{"title":"اغاني انصاف فتحي","href":"https://www.sm3na.com/audios/21a5a15835"},{"title":"اغاني الطيب مدثر","href":"https://www.sm3na.com/audios/a5476afb7e"},{"title":"اغاني أسماء الشيخ","href":"https://www.sm3na.com/audios/ea92a92550"},{"title":"اغاني ابراهيم خوجلي","href":"https://www.sm3na.com/audios/f64d32a552"},{"title":"اغاني أحمد شاويش","href":"https://www.sm3na.com/audios/ac1b4a0f97"},{"title":"اغاني أم بلينه السنوسي","href":"https://www.sm3na.com/audios/6f39001491"},{"title":"اغاني آمال النور","href":"https://www.sm3na.com/audios/8261f10d05"},{"title":"اغاني إيمان توفيق","href":"https://www.sm3na.com/audios/7c1be92f64"},{"title":"اغاني احمد البنا","href":"https://www.sm3na.com/audios/11f61edae2"},{"title":"اغاني أحمد بورتسودان","href":"https://www.sm3na.com/audios/eec73c4903"},{"title":"اغاني اسامه الشيخ","href":"https://www.sm3na.com/audios/d9ad45bf7f"},{"title":"اغاني احمد الجقر","href":"https://www.sm3na.com/audios/9f4467edd7"},{"title":"اغاني ابو ذر عبد الباقى","href":"https://www.sm3na.com/audios/c5df69a976"}]

SingerPageReponseModel singerPageReponseModelFromJson(String str) => SingerPageReponseModel.fromJson(json.decode(str));
String singerPageReponseModelToJson(SingerPageReponseModel data) => json.encode(data.toJson());
class SingerPageReponseModel {
  SingerPageReponseModel({
      String? sectionTitle, 
      List<Links>? links,}){
    _sectionTitle = sectionTitle;
    _links = links;
}

  SingerPageReponseModel.fromJson(dynamic json) {
    _sectionTitle = json['section_title'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
  }
  String? _sectionTitle;
  List<Links>? _links;

  String? get sectionTitle => _sectionTitle;
  List<Links>? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['section_title'] = _sectionTitle;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "اغاني أحمد الصادق"
/// href : "https://www.sm3na.com/audios/c6938f52cb"

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());
class Links {
  Links({
      String? title, 
      String? href,}){
    _title = title;
    _href = href;
}

  Links.fromJson(dynamic json) {
    _title = json['title'];
    _href = json['href'];
  }
  String? _title;
  String? _href;

  String? get title => _title;
  String? get href => _href;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['href'] = _href;
    return map;
  }

}