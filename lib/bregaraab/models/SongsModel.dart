import 'dart:convert';
/// singer_name : ""
/// url : ""
/// songs : [{"song_name":"","url":""}]

SongsModel songsModelFromJson(String str) => SongsModel.fromJson(json.decode(str));
String songsModelToJson(SongsModel data) => json.encode(data.toJson());
class SongsModel {
  SongsModel({
      String? singerName, 
      String? url, 
      List<Songs>? songs,}){
    _singerName = singerName;
    _url = url;
    _songs = songs;
}

  SongsModel.fromJson(dynamic json) {
    _singerName = json['singer_name'];
    _url = json['url'];
    if (json['songs'] != null) {
      _songs = [];
      json['songs'].forEach((v) {
        _songs?.add(Songs.fromJson(v));
      });
    }
  }
  String? _singerName;
  String? _url;
  List<Songs>? _songs;
SongsModel copyWith({  String? singerName,
  String? url,
  List<Songs>? songs,
}) => SongsModel(  singerName: singerName ?? _singerName,
  url: url ?? _url,
  songs: songs ?? _songs,
);
  String? get singerName => _singerName;
  String? get url => _url;
  List<Songs>? get songs => _songs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['singer_name'] = _singerName;
    map['url'] = _url;
    if (_songs != null) {
      map['songs'] = _songs?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// song_name : ""
/// url : ""

Songs songsFromJson(String str) => Songs.fromJson(json.decode(str));
String songsToJson(Songs data) => json.encode(data.toJson());
class Songs {
  Songs({
      String? songName, 
      String? url,}){
    _songName = songName;
    _url = url;
}

  Songs.fromJson(dynamic json) {
    _songName = json['song_name'];
    _url = json['url'];
  }
  String? _songName;
  String? _url;
Songs copyWith({  String? songName,
  String? url,
}) => Songs(  songName: songName ?? _songName,
  url: url ?? _url,
);
  String? get songName => _songName;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['song_name'] = _songName;
    map['url'] = _url;
    return map;
  }

}