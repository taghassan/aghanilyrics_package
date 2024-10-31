import 'dart:convert';
/// songName : ""
/// lyrics : ""
/// composer : ""

SongResponseModel songResponseModelFromJson(String str) => SongResponseModel.fromJson(json.decode(str));
String songResponseModelToJson(SongResponseModel data) => json.encode(data.toJson());
class SongResponseModel {
  SongResponseModel({
      String? songName, 
      String? lyrics, 
      String? lyricsUrl,
      String? composer,}){
    _songName = songName;
    _lyrics = lyrics;
    _lyricsUrl = lyricsUrl;
    _composer = composer;
}

  SongResponseModel.fromJson(dynamic json) {
    _songName = json['songName'];
    _lyrics = json['lyrics'];
    _lyricsUrl = json['lyricsUrl'];
    _composer = json['composer'];
  }
  String? _songName;
  String? _lyrics;
  String? _lyricsUrl;
  String? _composer;

  String? get songName => _songName;
  String? get lyrics => _lyrics;
  String? get lyricsUrl => _lyricsUrl;
  String? get composer => _composer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['songName'] = _songName;
    map['lyrics'] = _lyrics;
    map['lyricsUrl'] = _lyricsUrl;
    map['composer'] = _composer;
    return map;
  }

}