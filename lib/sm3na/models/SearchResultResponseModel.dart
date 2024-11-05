import 'dart:convert';
/// linkText : "سكت الرباب (محمود عبد العزيز)"
/// link : "https://www.sm3na.com/audio/2e62984d00a2"
/// image : "https://www.sm3na.com/images/singerspics/sudan/m_abdulaziz.gif"
/// isManyAudios : false

SearchResultResponseModel searchResultResponseModelFromJson(String str) => SearchResultResponseModel.fromJson(json.decode(str));
String searchResultResponseModelToJson(SearchResultResponseModel data) => json.encode(data.toJson());
class SearchResultResponseModel {
  SearchResultResponseModel({
      String? linkText, 
      String? link, 
      String? image, 
      bool? isManyAudios,}){
    _linkText = linkText;
    _link = link;
    _image = image;
    _isManyAudios = isManyAudios;
}

  SearchResultResponseModel.fromJson(dynamic json) {
    _linkText = json['linkText'];
    _link = json['link'];
    _image = json['image'];
    _isManyAudios = json['isManyAudios'];
  }
  String? _linkText;
  String? _link;
  String? _image;
  bool? _isManyAudios;
SearchResultResponseModel copyWith({  String? linkText,
  String? link,
  String? image,
  bool? isManyAudios,
}) => SearchResultResponseModel(  linkText: linkText ?? _linkText,
  link: link ?? _link,
  image: image ?? _image,
  isManyAudios: isManyAudios ?? _isManyAudios,
);
  String? get linkText => _linkText;
  String? get link => _link;
  String? get image => _image;
  bool? get isManyAudios => _isManyAudios;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['linkText'] = _linkText;
    map['link'] = _link;
    map['image'] = _image;
    map['isManyAudios'] = _isManyAudios;
    return map;
  }

}