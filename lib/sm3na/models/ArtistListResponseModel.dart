import 'dart:convert';
/// header : "اقسام الفنانين"
/// links : [{"title":"اغانى مصرية","url":"https://www.sm3na.com/cat/egyptian_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني لبنانيه","url":"https://www.sm3na.com/cat/lebanese_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني سعودية","url":"https://www.sm3na.com/cat/saudi_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني عراقيه","url":"https://www.sm3na.com/cat/iraqi_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني سورية","url":"https://www.sm3na.com/cat/syrian_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني سودانية","url":"https://www.sm3na.com/cat/sudanese_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني كويتيه","url":"https://www.sm3na.com/cat/kuwaiti_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني إماراتيه","url":"https://www.sm3na.com/cat/emirati_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني اردنيه","url":"https://www.sm3na.com/cat/jordanian_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني مغربية","url":"https://www.sm3na.com/cat/moroco_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني جزائرية","url":"https://www.sm3na.com/cat/algerian_songs","is_category_url":true,"is_audios_url":false},{"title":"اغاني عربيه اخرى","url":"https://www.sm3na.com/cat/arabic_songs","is_category_url":true,"is_audios_url":false}]

ArtistListResponseModel artistListResponseModelFromJson(String str) => ArtistListResponseModel.fromJson(json.decode(str));
String artistListResponseModelToJson(ArtistListResponseModel data) => json.encode(data.toJson());
class ArtistListResponseModel {
  ArtistListResponseModel({
      String? header, 
      List<Links>? links,}){
    _header = header;
    _links = links;
}

  ArtistListResponseModel.fromJson(dynamic json) {
    _header = json['header'];
    if (json['links'] != null) {
      _links = [];
      json['links'].forEach((v) {
        _links?.add(Links.fromJson(v));
      });
    }
  }
  String? _header;
  List<Links>? _links;

  String? get header => _header;
  List<Links>? get links => _links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['header'] = _header;
    if (_links != null) {
      map['links'] = _links?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// title : "اغانى مصرية"
/// url : "https://www.sm3na.com/cat/egyptian_songs"
/// is_category_url : true
/// is_audios_url : false

Links linksFromJson(String str) => Links.fromJson(json.decode(str));
String linksToJson(Links data) => json.encode(data.toJson());
class Links {
  Links({
      String? title, 
      String? url, 
      bool? isCategoryUrl, 
      bool? isAudiosUrl,}){
    _title = title;
    _url = url;
    _isCategoryUrl = isCategoryUrl;
    _isAudiosUrl = isAudiosUrl;
}

  Links.fromJson(dynamic json) {
    _title = json['title'];
    _url = json['url'];
    _isCategoryUrl = json['is_category_url'];
    _isAudiosUrl = json['is_audios_url'];
  }
  String? _title;
  String? _url;
  bool? _isCategoryUrl;
  bool? _isAudiosUrl;

  String? get title => _title;
  String? get url => _url;
  bool? get isCategoryUrl => _isCategoryUrl;
  bool? get isAudiosUrl => _isAudiosUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['url'] = _url;
    map['is_category_url'] = _isCategoryUrl;
    map['is_audios_url'] = _isAudiosUrl;
    return map;
  }

}