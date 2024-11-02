import 'dart:convert';
/// src : ""
/// full_url : ""
/// big_page_url : ""
/// title : ""

FindingResponseModel findingResponseModelFromJson(String str) => FindingResponseModel.fromJson(json.decode(str));
String findingResponseModelToJson(FindingResponseModel data) => json.encode(data.toJson());
class FindingResponseModel {
  FindingResponseModel({
      String? src, 
      String? fullUrl, 
      String? bigPageUrl, 
      String? keywords,
      String? title,}){
    _src = src;
    _fullUrl = fullUrl;
    _bigPageUrl = bigPageUrl;
    _keywords = keywords;
    _title = title;
}

  FindingResponseModel.fromJson(dynamic json) {
    _src = json['src'];
    _fullUrl = json['full_url'];
    _bigPageUrl = json['big_page_url'];
    _keywords = json['keywords'];
    _title = json['title'];
  }
  String? _src;
  String? _fullUrl;
  String? _bigPageUrl;
  String? _keywords;
  String? _title;

  String? get src => _src;
  String? get fullUrl => _fullUrl;
  String? get bigPageUrl => _bigPageUrl;
  String? get keywords => _keywords;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['src'] = _src;
    map['full_url'] = _fullUrl;
    map['keywords'] = _keywords;
    map['big_page_url'] = _bigPageUrl;
    map['title'] = _title;
    return map;
  }

}