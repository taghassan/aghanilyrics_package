import 'dart:convert';
/// id : 26739
/// number : 426
/// pref : "رسالة إلى ران"
/// duration : 1511
/// ep_duration : 25
/// cover : "https://spacetoongo.com/media/89186-1.jpg"
/// cover_full_path : "https://spacetoongo.com/media/89186-1.jpg"
/// watch_count : 0
/// cost : "Free"
/// tv_series : 787
/// is_limited : 0
/// unpublish_date : null
/// created_at : "2024-08-31T22:30:10.000Z"

SpacetoonEpisodesResponseModel spacetoonEpisodesResponseModelFromJson(String str) => SpacetoonEpisodesResponseModel.fromJson(json.decode(str));
String spacetoonEpisodesResponseModelToJson(SpacetoonEpisodesResponseModel data) => json.encode(data.toJson());
class SpacetoonEpisodesResponseModel {
  SpacetoonEpisodesResponseModel({
      num? id, 
      num? number, 
      String? pref, 
      num? duration, 
      num? epDuration, 
      String? cover, 
      String? coverFullPath, 
      num? watchCount, 
      String? cost, 
      num? tvSeries, 
      num? isLimited, 
      dynamic unpublishDate, 
      String? createdAt,}){
    _id = id;
    _number = number;
    _pref = pref;
    _duration = duration;
    _epDuration = epDuration;
    _cover = cover;
    _coverFullPath = coverFullPath;
    _watchCount = watchCount;
    _cost = cost;
    _tvSeries = tvSeries;
    _isLimited = isLimited;
    _unpublishDate = unpublishDate;
    _createdAt = createdAt;
}

  SpacetoonEpisodesResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _number = json['number'];
    _pref = json['pref'];
    _duration = json['duration'];
    _epDuration = json['ep_duration'];
    _cover = json['cover'];
    _coverFullPath = json['cover_full_path'];
    _watchCount = json['watch_count'];
    _cost = json['cost'];
    _tvSeries = json['tv_series'];
    _isLimited = json['is_limited'];
    _unpublishDate = json['unpublish_date'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _number;
  String? _pref;
  num? _duration;
  num? _epDuration;
  String? _cover;
  String? _coverFullPath;
  num? _watchCount;
  String? _cost;
  num? _tvSeries;
  num? _isLimited;
  dynamic _unpublishDate;
  String? _createdAt;

  num? get id => _id;
  num? get number => _number;
  String? get pref => _pref;
  num? get duration => _duration;
  num? get epDuration => _epDuration;
  String? get cover => _cover;
  String? get coverFullPath => _coverFullPath;
  num? get watchCount => _watchCount;
  String? get cost => _cost;
  num? get tvSeries => _tvSeries;
  num? get isLimited => _isLimited;
  dynamic get unpublishDate => _unpublishDate;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['number'] = _number;
    map['pref'] = _pref;
    map['duration'] = _duration;
    map['ep_duration'] = _epDuration;
    map['cover'] = _cover;
    map['cover_full_path'] = _coverFullPath;
    map['watch_count'] = _watchCount;
    map['cost'] = _cost;
    map['tv_series'] = _tvSeries;
    map['is_limited'] = _isLimited;
    map['unpublish_date'] = _unpublishDate;
    map['created_at'] = _createdAt;
    return map;
  }

}