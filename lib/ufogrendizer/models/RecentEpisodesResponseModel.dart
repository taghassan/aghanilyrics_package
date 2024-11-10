import 'dart:convert';
/// tv_series_id : "973"
/// id : 31753
/// publish_date : "2024-11-10 16:05:00"
/// date_time : "2024-06-23 11:56:11"
/// publish_order : "1731243900"
/// number : "7"
/// pref : "بطل الجليد -بطل المياه"
/// duration : "430"
/// cover_full_path : "https://spacetoon.s.llnwi.net/images/1a9bb-7.jpg"
/// watch_count : "0"
/// cost : "Premium"
/// tv_series_cost : "Premium"
/// tv_series : "973"
/// name : "Slugterra  Ascension"
/// is_movie : 0
/// is_show : 0
/// is_song : 0
/// since : "اليوم"

RecentEpisodesResponseModel recentEpisodesResponseModelFromJson(String str) => RecentEpisodesResponseModel.fromJson(json.decode(str));
String recentEpisodesResponseModelToJson(RecentEpisodesResponseModel data) => json.encode(data.toJson());
class RecentEpisodesResponseModel {
  RecentEpisodesResponseModel({
      String? tvSeriesId, 
      num? id, 
      String? publishDate, 
      String? dateTime, 
      String? publishOrder, 
      String? number, 
      String? pref, 
      String? duration, 
      String? coverFullPath, 
      String? watchCount, 
      String? cost, 
      String? tvSeriesCost, 
      String? tvSeries, 
      String? name, 
      num? isMovie, 
      num? isShow, 
      num? isSong, 
      String? since,}){
    _tvSeriesId = tvSeriesId;
    _id = id;
    _publishDate = publishDate;
    _dateTime = dateTime;
    _publishOrder = publishOrder;
    _number = number;
    _pref = pref;
    _duration = duration;
    _coverFullPath = coverFullPath;
    _watchCount = watchCount;
    _cost = cost;
    _tvSeriesCost = tvSeriesCost;
    _tvSeries = tvSeries;
    _name = name;
    _isMovie = isMovie;
    _isShow = isShow;
    _isSong = isSong;
    _since = since;
}

  RecentEpisodesResponseModel.fromJson(dynamic json) {
    _tvSeriesId = json['tv_series_id'];
    _id = json['id'];
    _publishDate = json['publish_date'];
    _dateTime = json['date_time'];
    _publishOrder = json['publish_order'];
    _number = json['number'];
    _pref = json['pref'];
    _duration = json['duration'];
    _coverFullPath = json['cover_full_path'];
    _watchCount = json['watch_count'];
    _cost = json['cost'];
    _tvSeriesCost = json['tv_series_cost'];
    _tvSeries = json['tv_series'];
    _name = json['name'];
    _isMovie = json['is_movie'];
    _isShow = json['is_show'];
    _isSong = json['is_song'];
    _since = json['since'];
  }
  String? _tvSeriesId;
  num? _id;
  String? _publishDate;
  String? _dateTime;
  String? _publishOrder;
  String? _number;
  String? _pref;
  String? _duration;
  String? _coverFullPath;
  String? _watchCount;
  String? _cost;
  String? _tvSeriesCost;
  String? _tvSeries;
  String? _name;
  num? _isMovie;
  num? _isShow;
  num? _isSong;
  String? _since;

  String? get tvSeriesId => _tvSeriesId;
  num? get id => _id;
  String? get publishDate => _publishDate;
  String? get dateTime => _dateTime;
  String? get publishOrder => _publishOrder;
  String? get number => _number;
  String? get pref => _pref;
  String? get duration => _duration;
  String? get coverFullPath => _coverFullPath;
  String? get watchCount => _watchCount;
  String? get cost => _cost;
  String? get tvSeriesCost => _tvSeriesCost;
  String? get tvSeries => _tvSeries;
  String? get name => _name;
  num? get isMovie => _isMovie;
  num? get isShow => _isShow;
  num? get isSong => _isSong;
  String? get since => _since;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tv_series_id'] = _tvSeriesId;
    map['id'] = _id;
    map['publish_date'] = _publishDate;
    map['date_time'] = _dateTime;
    map['publish_order'] = _publishOrder;
    map['number'] = _number;
    map['pref'] = _pref;
    map['duration'] = _duration;
    map['cover_full_path'] = _coverFullPath;
    map['watch_count'] = _watchCount;
    map['cost'] = _cost;
    map['tv_series_cost'] = _tvSeriesCost;
    map['tv_series'] = _tvSeries;
    map['name'] = _name;
    map['is_movie'] = _isMovie;
    map['is_show'] = _isShow;
    map['is_song'] = _isSong;
    map['since'] = _since;
    return map;
  }

}