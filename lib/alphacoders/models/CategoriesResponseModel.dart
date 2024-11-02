import 'dart:convert';
/// link : ""
/// image : ""
/// title : ""

CategoriesResponseModel categoriesResponseModelFromJson(String str) => CategoriesResponseModel.fromJson(json.decode(str));
String categoriesResponseModelToJson(CategoriesResponseModel data) => json.encode(data.toJson());
class CategoriesResponseModel {
  CategoriesResponseModel({
      String? link, 
      String? image, 
      String? title,}){
    _link = link;
    _image = image;
    _title = title;
}

  CategoriesResponseModel.fromJson(dynamic json) {
    _link = json['link'];
    _image = json['image'];
    _title = json['title'];
  }
  String? _link;
  String? _image;
  String? _title;

  String? get link => _link;
  String? get image => _image;
  String? get title => _title;
  String? get path => _link?.split("/").last;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link'] = _link;
    map['image'] = _image;
    map['title'] = _title;
    return map;
  }

}