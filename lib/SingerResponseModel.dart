import 'dart:convert';
/// singerName : ""
/// url : ""
/// songs : ""
/// country : ""

SingerResponseModel singerResponseModelFromJson(String str) => SingerResponseModel.fromJson(json.decode(str));
String singerResponseModelToJson(SingerResponseModel data) => json.encode(data.toJson());
class SingerResponseModel {
  SingerResponseModel({
      String? singerName, 
      String? url, 
      String? songs, 
      String? country,}){
    _singerName = singerName;
    _url = url;
    _songs = songs;
    _country = country;
}

  SingerResponseModel.fromJson(dynamic json) {
    _singerName = json['singerName'];
    _url = json['url'];
    _songs = json['songs'];
    _country = json['country'];
  }
  String? _singerName;
  String? _url;
  String? _songs;
  String? _country;

  String? get singerName => _singerName;
  String? get url => _url;
  String? get songs => _songs;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['singerName'] = _singerName;
    map['url'] = _url;
    map['songs'] = _songs;
    map['country'] = _country;
    return map;
  }

}