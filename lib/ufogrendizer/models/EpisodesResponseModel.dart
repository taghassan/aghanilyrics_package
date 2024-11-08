import 'dart:convert';
/// id : 2957
/// title : "1.  الحلقة الأولى"
/// show_id : 293
/// duration : 0
/// order_id : 0
/// created_at : "2024-08-31T17:39:44.000Z"

EpisodesResponseModel episodesResponseModelFromJson(String str) => EpisodesResponseModel.fromJson(json.decode(str));
String episodesResponseModelToJson(EpisodesResponseModel data) => json.encode(data.toJson());
class EpisodesResponseModel {
  EpisodesResponseModel({
      num? id, 
      String? title, 
      num? showId, 
      num? duration, 
      num? orderId, 
      String? createdAt,}){
    _id = id;
    _title = title;
    _showId = showId;
    _duration = duration;
    _orderId = orderId;
    _createdAt = createdAt;
}

  EpisodesResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _showId = json['show_id'];
    _duration = json['duration'];
    _orderId = json['order_id'];
    _createdAt = json['created_at'];
  }
  num? _id;
  String? _title;
  num? _showId;
  num? _duration;
  num? _orderId;
  String? _createdAt;

  num? get id => _id;
  String? get title => _title;
  num? get showId => _showId;
  num? get duration => _duration;
  num? get orderId => _orderId;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['show_id'] = _showId;
    map['duration'] = _duration;
    map['order_id'] = _orderId;
    map['created_at'] = _createdAt;
    return map;
  }

}