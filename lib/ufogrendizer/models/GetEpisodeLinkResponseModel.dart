import 'dart:convert';
/// id : "22403"
/// cdn_stream_private_id : null
/// with_ads : false
/// cover_full_path : "https://spacetoon.s.llnwi.net/images/895ca-8.jpg"
/// planet : "10"
/// tv_series : "585"
/// series_cost : "Premium"
/// with_logo : 1
/// number : "8"
/// series_name : "Hunter X Hunter"
/// name : 8
/// series_id : "585"
/// is_movie : "0"
/// is_show : "0"
/// is_song : "0"
/// cost : "Premium"
/// screen : "9/16"
/// show_episode_numbers : "1"
/// prev_epid : "22333"
/// next_epid : "22405"
/// next_ep_title : "احترسوا من السجناء"
/// next_ep_number : "9"
/// skip_outro : 1311
/// episodes_playlist : "TODO Check for ios?"
/// log_id : null
/// is_subscribed : true
/// allow_parental_time : true
/// link : "https://spacemmdod-mmd-cust.lldns.net/secure/16-9/Hunter-X-Hunter/740b2555fdbdcf591ef54f4011a8da99_EP8.smil/manifest.m3u8?&p=45&e=1731239339&h=003bb450c5588942f69d583b61bbe10c&hls_client_manifest_version=1"
/// ep_duration : "1406"
/// ads_vmap_ios : ""
/// new_vmap : ""
/// ads_vmap : ""
/// google_ads_slots : []
/// skip_intro : [0,114]
/// ctr_response : {"profile":{"name":"Wajdi i","gender":"M"},"headline":"اشترك الآن وعش مع الصيادين مغامرات لا تنسى في ","subtitle":"هنتر هنتر","message":" هذه الحلقة متاحة للمشتركين فقط","placeholder":"https://spacetoon.s.llnwi.net/images/7edeb-premium-ep.jpg","plans":{"promote":{"promote":1,"home_details":{"title":"(USD30) اشترك الآن بنصف السعر!","offerText":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","body":"اغتنم الفرصة واشترك الآن بنصف السعر فقط"},"offer":{"number":"وفر 50٪","text":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","name":"اشترك الآن بنصف السعر!"},"price_object":{"offer":false,"regular_price":60,"offer_price":30,"currency":"USD"},"duration_object":{"number":"360","name":"سنوياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.oneyear.noads.50discount","duration":"360","id":"19"},"others":[{"promote":0,"home_details":{"title":"(USD4.99) 7 أيام بلا إعلانات","offerText":"0","body":""},"offer":{"number":"0","text":"0","name":"7 أيام بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":4.99,"currency":"USD"},"duration_object":{"number":"7","name":"7 أيام"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.seven.days.with.noads","duration":"7","id":"39"},{"promote":0,"home_details":{"title":"(USD12.99) 3 اشهر بلا إعلانات","offerText":"0","body":""},"offer":{"number":"0","text":"0","name":"3 اشهر بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":12.99,"currency":"USD"},"duration_object":{"number":"90","name":null},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.threemonth.with.noads","duration":"90","id":"37"},{"promote":0,"home_details":{"title":"(USD4.99) شهر بلا إعلانات","offerText":"0","body":"استمتع بأفضل العروض"},"offer":{"number":"0","text":"0","name":"شهر بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":4.99,"currency":"USD"},"duration_object":{"number":"30","name":"شهرياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.month.with.noads","duration":"30","id":"3"},{"promote":0,"home_details":{"title":"(USD2.99)  شهر مع إعلانات","offerText":"0","body":"استمتع بأفضل العروض"},"offer":{"number":"0","text":"0","name":" شهر مع إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":2.99,"currency":"USD"},"duration_object":{"number":"30","name":"شهرياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.month.with.ads","duration":"30","id":"4"}]}}
/// questionnaire : null
/// last_watched_timestamp : 0
/// already_watched : false

GetEpisodeLinkResponseModel getEpisodeLinkResponseModelFromJson(String str) => GetEpisodeLinkResponseModel.fromJson(json.decode(str));
String getEpisodeLinkResponseModelToJson(GetEpisodeLinkResponseModel data) => json.encode(data.toJson());
class GetEpisodeLinkResponseModel {
  GetEpisodeLinkResponseModel({
      String? id, 
      dynamic cdnStreamPrivateId, 
      bool? withAds, 
      String? coverFullPath, 
      String? planet, 
      String? tvSeries, 
      String? seriesCost, 
      num? withLogo, 
      String? number, 
      String? seriesName, 
      num? name, 
      String? seriesId, 
      String? isMovie, 
      String? isShow, 
      String? isSong, 
      String? cost, 
      String? screen, 
      String? showEpisodeNumbers, 
      String? prevEpid, 
      String? nextEpid, 
      String? nextEpTitle, 
      String? nextEpNumber, 
      num? skipOutro, 
      String? episodesPlaylist, 
      dynamic logId, 
      bool? isSubscribed, 
      bool? allowParentalTime, 
      String? link, 
      String? epDuration, 
      String? adsVmapIos, 
      String? newVmap, 
      String? adsVmap, 
      List<dynamic>? googleAdsSlots, 
      List<num>? skipIntro, 
      CtrResponse? ctrResponse, 
      dynamic questionnaire, 
      num? lastWatchedTimestamp, 
      bool? alreadyWatched,}){
    _id = id;
    _cdnStreamPrivateId = cdnStreamPrivateId;
    _withAds = withAds;
    _coverFullPath = coverFullPath;
    _planet = planet;
    _tvSeries = tvSeries;
    _seriesCost = seriesCost;
    _withLogo = withLogo;
    _number = number;
    _seriesName = seriesName;
    _name = name;
    _seriesId = seriesId;
    _isMovie = isMovie;
    _isShow = isShow;
    _isSong = isSong;
    _cost = cost;
    _screen = screen;
    _showEpisodeNumbers = showEpisodeNumbers;
    _prevEpid = prevEpid;
    _nextEpid = nextEpid;
    _nextEpTitle = nextEpTitle;
    _nextEpNumber = nextEpNumber;
    _skipOutro = skipOutro;
    _episodesPlaylist = episodesPlaylist;
    _logId = logId;
    _isSubscribed = isSubscribed;
    _allowParentalTime = allowParentalTime;
    _link = link;
    _epDuration = epDuration;
    _adsVmapIos = adsVmapIos;
    _newVmap = newVmap;
    _adsVmap = adsVmap;
    _googleAdsSlots = googleAdsSlots;
    _skipIntro = skipIntro;
    _ctrResponse = ctrResponse;
    _questionnaire = questionnaire;
    _lastWatchedTimestamp = lastWatchedTimestamp;
    _alreadyWatched = alreadyWatched;
}

  GetEpisodeLinkResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _cdnStreamPrivateId = json['cdn_stream_private_id'];
    _withAds = json['with_ads'];
    _coverFullPath = json['cover_full_path'];
    _planet = json['planet'];
    _tvSeries = json['tv_series'];
    _seriesCost = json['series_cost'];
    _withLogo = json['with_logo'];
    _number = json['number'];
    _seriesName = json['series_name'];
    _name = json['name'];
    _seriesId = json['series_id'];
    _isMovie = json['is_movie'];
    _isShow = json['is_show'];
    _isSong = json['is_song'];
    _cost = json['cost'];
    _screen = json['screen'];
    _showEpisodeNumbers = json['show_episode_numbers'];
    _prevEpid = json['prev_epid'];
    _nextEpid = json['next_epid'];
    _nextEpTitle = json['next_ep_title'];
    _nextEpNumber = json['next_ep_number'];
    _skipOutro = json['skip_outro'];
    _episodesPlaylist = json['episodes_playlist'];
    _logId = json['log_id'];
    _isSubscribed = json['is_subscribed'];
    _allowParentalTime = json['allow_parental_time'];
    _link = json['link'];
    _epDuration = json['ep_duration'];
    _adsVmapIos = json['ads_vmap_ios'];
    _newVmap = json['new_vmap'];
    _adsVmap = json['ads_vmap'];

    _skipIntro = json['skip_intro'] != null ? json['skip_intro'].cast<num>() : [];
    _ctrResponse = json['ctr_response'] != null ? CtrResponse.fromJson(json['ctr_response']) : null;
    _questionnaire = json['questionnaire'];
    _lastWatchedTimestamp = json['last_watched_timestamp'];
    _alreadyWatched = json['already_watched'];
  }
  String? _id;
  dynamic _cdnStreamPrivateId;
  bool? _withAds;
  String? _coverFullPath;
  String? _planet;
  String? _tvSeries;
  String? _seriesCost;
  num? _withLogo;
  String? _number;
  String? _seriesName;
  num? _name;
  String? _seriesId;
  String? _isMovie;
  String? _isShow;
  String? _isSong;
  String? _cost;
  String? _screen;
  String? _showEpisodeNumbers;
  String? _prevEpid;
  String? _nextEpid;
  String? _nextEpTitle;
  String? _nextEpNumber;
  num? _skipOutro;
  String? _episodesPlaylist;
  dynamic _logId;
  bool? _isSubscribed;
  bool? _allowParentalTime;
  String? _link;
  String? _epDuration;
  String? _adsVmapIos;
  String? _newVmap;
  String? _adsVmap;
  List<dynamic>? _googleAdsSlots;
  List<num>? _skipIntro;
  CtrResponse? _ctrResponse;
  dynamic _questionnaire;
  num? _lastWatchedTimestamp;
  bool? _alreadyWatched;

  String? get id => _id;
  dynamic get cdnStreamPrivateId => _cdnStreamPrivateId;
  bool? get withAds => _withAds;
  String? get coverFullPath => _coverFullPath;
  String? get planet => _planet;
  String? get tvSeries => _tvSeries;
  String? get seriesCost => _seriesCost;
  num? get withLogo => _withLogo;
  String? get number => _number;
  String? get seriesName => _seriesName;
  num? get name => _name;
  String? get seriesId => _seriesId;
  String? get isMovie => _isMovie;
  String? get isShow => _isShow;
  String? get isSong => _isSong;
  String? get cost => _cost;
  String? get screen => _screen;
  String? get showEpisodeNumbers => _showEpisodeNumbers;
  String? get prevEpid => _prevEpid;
  String? get nextEpid => _nextEpid;
  String? get nextEpTitle => _nextEpTitle;
  String? get nextEpNumber => _nextEpNumber;
  num? get skipOutro => _skipOutro;
  String? get episodesPlaylist => _episodesPlaylist;
  dynamic get logId => _logId;
  bool? get isSubscribed => _isSubscribed;
  bool? get allowParentalTime => _allowParentalTime;
  String? get link => _link;
  String? get epDuration => _epDuration;
  String? get adsVmapIos => _adsVmapIos;
  String? get newVmap => _newVmap;
  String? get adsVmap => _adsVmap;
  List<dynamic>? get googleAdsSlots => _googleAdsSlots;
  List<num>? get skipIntro => _skipIntro;
  CtrResponse? get ctrResponse => _ctrResponse;
  dynamic get questionnaire => _questionnaire;
  num? get lastWatchedTimestamp => _lastWatchedTimestamp;
  bool? get alreadyWatched => _alreadyWatched;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['cdn_stream_private_id'] = _cdnStreamPrivateId;
    map['with_ads'] = _withAds;
    map['cover_full_path'] = _coverFullPath;
    map['planet'] = _planet;
    map['tv_series'] = _tvSeries;
    map['series_cost'] = _seriesCost;
    map['with_logo'] = _withLogo;
    map['number'] = _number;
    map['series_name'] = _seriesName;
    map['name'] = _name;
    map['series_id'] = _seriesId;
    map['is_movie'] = _isMovie;
    map['is_show'] = _isShow;
    map['is_song'] = _isSong;
    map['cost'] = _cost;
    map['screen'] = _screen;
    map['show_episode_numbers'] = _showEpisodeNumbers;
    map['prev_epid'] = _prevEpid;
    map['next_epid'] = _nextEpid;
    map['next_ep_title'] = _nextEpTitle;
    map['next_ep_number'] = _nextEpNumber;
    map['skip_outro'] = _skipOutro;
    map['episodes_playlist'] = _episodesPlaylist;
    map['log_id'] = _logId;
    map['is_subscribed'] = _isSubscribed;
    map['allow_parental_time'] = _allowParentalTime;
    map['link'] = _link;
    map['ep_duration'] = _epDuration;
    map['ads_vmap_ios'] = _adsVmapIos;
    map['new_vmap'] = _newVmap;
    map['ads_vmap'] = _adsVmap;
    if (_googleAdsSlots != null) {
      map['google_ads_slots'] = _googleAdsSlots?.map((v) => v.toJson()).toList();
    }
    map['skip_intro'] = _skipIntro;
    if (_ctrResponse != null) {
      map['ctr_response'] = _ctrResponse?.toJson();
    }
    map['questionnaire'] = _questionnaire;
    map['last_watched_timestamp'] = _lastWatchedTimestamp;
    map['already_watched'] = _alreadyWatched;
    return map;
  }

}

/// profile : {"name":"Wajdi i","gender":"M"}
/// headline : "اشترك الآن وعش مع الصيادين مغامرات لا تنسى في "
/// subtitle : "هنتر هنتر"
/// message : " هذه الحلقة متاحة للمشتركين فقط"
/// placeholder : "https://spacetoon.s.llnwi.net/images/7edeb-premium-ep.jpg"
/// plans : {"promote":{"promote":1,"home_details":{"title":"(USD30) اشترك الآن بنصف السعر!","offerText":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","body":"اغتنم الفرصة واشترك الآن بنصف السعر فقط"},"offer":{"number":"وفر 50٪","text":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","name":"اشترك الآن بنصف السعر!"},"price_object":{"offer":false,"regular_price":60,"offer_price":30,"currency":"USD"},"duration_object":{"number":"360","name":"سنوياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.oneyear.noads.50discount","duration":"360","id":"19"},"others":[{"promote":0,"home_details":{"title":"(USD4.99) 7 أيام بلا إعلانات","offerText":"0","body":""},"offer":{"number":"0","text":"0","name":"7 أيام بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":4.99,"currency":"USD"},"duration_object":{"number":"7","name":"7 أيام"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.seven.days.with.noads","duration":"7","id":"39"},{"promote":0,"home_details":{"title":"(USD12.99) 3 اشهر بلا إعلانات","offerText":"0","body":""},"offer":{"number":"0","text":"0","name":"3 اشهر بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":12.99,"currency":"USD"},"duration_object":{"number":"90","name":null},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.threemonth.with.noads","duration":"90","id":"37"},{"promote":0,"home_details":{"title":"(USD4.99) شهر بلا إعلانات","offerText":"0","body":"استمتع بأفضل العروض"},"offer":{"number":"0","text":"0","name":"شهر بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":4.99,"currency":"USD"},"duration_object":{"number":"30","name":"شهرياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.month.with.noads","duration":"30","id":"3"},{"promote":0,"home_details":{"title":"(USD2.99)  شهر مع إعلانات","offerText":"0","body":"استمتع بأفضل العروض"},"offer":{"number":"0","text":"0","name":" شهر مع إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":2.99,"currency":"USD"},"duration_object":{"number":"30","name":"شهرياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.month.with.ads","duration":"30","id":"4"}]}

CtrResponse ctrResponseFromJson(String str) => CtrResponse.fromJson(json.decode(str));
String ctrResponseToJson(CtrResponse data) => json.encode(data.toJson());
class CtrResponse {
  CtrResponse({
      Profile? profile, 
      String? headline, 
      String? subtitle, 
      String? message, 
      String? placeholder, 
      Plans? plans,}){
    _profile = profile;
    _headline = headline;
    _subtitle = subtitle;
    _message = message;
    _placeholder = placeholder;
    _plans = plans;
}

  CtrResponse.fromJson(dynamic json) {
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
    _headline = json['headline'];
    _subtitle = json['subtitle'];
    _message = json['message'];
    _placeholder = json['placeholder'];
    _plans = json['plans'] != null ? Plans.fromJson(json['plans']) : null;
  }
  Profile? _profile;
  String? _headline;
  String? _subtitle;
  String? _message;
  String? _placeholder;
  Plans? _plans;

  Profile? get profile => _profile;
  String? get headline => _headline;
  String? get subtitle => _subtitle;
  String? get message => _message;
  String? get placeholder => _placeholder;
  Plans? get plans => _plans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    map['headline'] = _headline;
    map['subtitle'] = _subtitle;
    map['message'] = _message;
    map['placeholder'] = _placeholder;
    if (_plans != null) {
      map['plans'] = _plans?.toJson();
    }
    return map;
  }

}

/// promote : {"promote":1,"home_details":{"title":"(USD30) اشترك الآن بنصف السعر!","offerText":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","body":"اغتنم الفرصة واشترك الآن بنصف السعر فقط"},"offer":{"number":"وفر 50٪","text":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","name":"اشترك الآن بنصف السعر!"},"price_object":{"offer":false,"regular_price":60,"offer_price":30,"currency":"USD"},"duration_object":{"number":"360","name":"سنوياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.oneyear.noads.50discount","duration":"360","id":"19"}
/// others : [{"promote":0,"home_details":{"title":"(USD4.99) 7 أيام بلا إعلانات","offerText":"0","body":""},"offer":{"number":"0","text":"0","name":"7 أيام بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":4.99,"currency":"USD"},"duration_object":{"number":"7","name":"7 أيام"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.seven.days.with.noads","duration":"7","id":"39"},{"promote":0,"home_details":{"title":"(USD12.99) 3 اشهر بلا إعلانات","offerText":"0","body":""},"offer":{"number":"0","text":"0","name":"3 اشهر بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":12.99,"currency":"USD"},"duration_object":{"number":"90","name":null},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.threemonth.with.noads","duration":"90","id":"37"},{"promote":0,"home_details":{"title":"(USD4.99) شهر بلا إعلانات","offerText":"0","body":"استمتع بأفضل العروض"},"offer":{"number":"0","text":"0","name":"شهر بلا إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":4.99,"currency":"USD"},"duration_object":{"number":"30","name":"شهرياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.month.with.noads","duration":"30","id":"3"},{"promote":0,"home_details":{"title":"(USD2.99)  شهر مع إعلانات","offerText":"0","body":"استمتع بأفضل العروض"},"offer":{"number":"0","text":"0","name":" شهر مع إعلانات"},"price_object":{"offer":false,"regular_price":0,"offer_price":2.99,"currency":"USD"},"duration_object":{"number":"30","name":"شهرياً"},"currency":"USD","sku_code":"com.spacetoon.spacetoongo.sub.month.with.ads","duration":"30","id":"4"}]

Plans plansFromJson(String str) => Plans.fromJson(json.decode(str));
String plansToJson(Plans data) => json.encode(data.toJson());
class Plans {
  Plans({
      Promote? promote, 
      List<Others>? others,}){
    _promote = promote;
    _others = others;
}

  Plans.fromJson(dynamic json) {
    _promote = json['promote'] != null ? Promote.fromJson(json['promote']) : null;
    if (json['others'] != null) {
      _others = [];
      json['others'].forEach((v) {
        _others?.add(Others.fromJson(v));
      });
    }
  }
  Promote? _promote;
  List<Others>? _others;

  Promote? get promote => _promote;
  List<Others>? get others => _others;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_promote != null) {
      map['promote'] = _promote?.toJson();
    }
    if (_others != null) {
      map['others'] = _others?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// promote : 0
/// home_details : {"title":"(USD4.99) 7 أيام بلا إعلانات","offerText":"0","body":""}
/// offer : {"number":"0","text":"0","name":"7 أيام بلا إعلانات"}
/// price_object : {"offer":false,"regular_price":0,"offer_price":4.99,"currency":"USD"}
/// duration_object : {"number":"7","name":"7 أيام"}
/// currency : "USD"
/// sku_code : "com.spacetoon.spacetoongo.sub.seven.days.with.noads"
/// duration : "7"
/// id : "39"

Others othersFromJson(String str) => Others.fromJson(json.decode(str));
String othersToJson(Others data) => json.encode(data.toJson());
class Others {
  Others({
      num? promote, 
      HomeDetails? homeDetails, 
      Offer? offer, 
      PriceObject? priceObject, 
      DurationObject? durationObject, 
      String? currency, 
      String? skuCode, 
      String? duration, 
      String? id,}){
    _promote = promote;
    _homeDetails = homeDetails;
    _offer = offer;
    _priceObject = priceObject;
    _durationObject = durationObject;
    _currency = currency;
    _skuCode = skuCode;
    _duration = duration;
    _id = id;
}

  Others.fromJson(dynamic json) {
    _promote = json['promote'];
    _homeDetails = json['home_details'] != null ? HomeDetails.fromJson(json['home_details']) : null;
    _offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
    _priceObject = json['price_object'] != null ? PriceObject.fromJson(json['price_object']) : null;
    _durationObject = json['duration_object'] != null ? DurationObject.fromJson(json['duration_object']) : null;
    _currency = json['currency'];
    _skuCode = json['sku_code'];
    _duration = json['duration'];
    _id = json['id'];
  }
  num? _promote;
  HomeDetails? _homeDetails;
  Offer? _offer;
  PriceObject? _priceObject;
  DurationObject? _durationObject;
  String? _currency;
  String? _skuCode;
  String? _duration;
  String? _id;

  num? get promote => _promote;
  HomeDetails? get homeDetails => _homeDetails;
  Offer? get offer => _offer;
  PriceObject? get priceObject => _priceObject;
  DurationObject? get durationObject => _durationObject;
  String? get currency => _currency;
  String? get skuCode => _skuCode;
  String? get duration => _duration;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['promote'] = _promote;
    if (_homeDetails != null) {
      map['home_details'] = _homeDetails?.toJson();
    }
    if (_offer != null) {
      map['offer'] = _offer?.toJson();
    }
    if (_priceObject != null) {
      map['price_object'] = _priceObject?.toJson();
    }
    if (_durationObject != null) {
      map['duration_object'] = _durationObject?.toJson();
    }
    map['currency'] = _currency;
    map['sku_code'] = _skuCode;
    map['duration'] = _duration;
    map['id'] = _id;
    return map;
  }

}

/// number : "7"
/// name : "7 أيام"

DurationObject durationObjectFromJson(String str) => DurationObject.fromJson(json.decode(str));
String durationObjectToJson(DurationObject data) => json.encode(data.toJson());
class DurationObject {
  DurationObject({
      String? number, 
      String? name,}){
    _number = number;
    _name = name;
}

  DurationObject.fromJson(dynamic json) {
    _number = json['number'];
    _name = json['name'];
  }
  String? _number;
  String? _name;

  String? get number => _number;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['name'] = _name;
    return map;
  }

}

/// offer : false
/// regular_price : 0
/// offer_price : 4.99
/// currency : "USD"

PriceObject priceObjectFromJson(String str) => PriceObject.fromJson(json.decode(str));
String priceObjectToJson(PriceObject data) => json.encode(data.toJson());
class PriceObject {
  PriceObject({
      bool? offer, 
      num? regularPrice, 
      num? offerPrice, 
      String? currency,}){
    _offer = offer;
    _regularPrice = regularPrice;
    _offerPrice = offerPrice;
    _currency = currency;
}

  PriceObject.fromJson(dynamic json) {
    _offer = json['offer'];
    _regularPrice = json['regular_price'];
    _offerPrice = json['offer_price'];
    _currency = json['currency'];
  }
  bool? _offer;
  num? _regularPrice;
  num? _offerPrice;
  String? _currency;

  bool? get offer => _offer;
  num? get regularPrice => _regularPrice;
  num? get offerPrice => _offerPrice;
  String? get currency => _currency;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['offer'] = _offer;
    map['regular_price'] = _regularPrice;
    map['offer_price'] = _offerPrice;
    map['currency'] = _currency;
    return map;
  }

}

/// number : "0"
/// text : "0"
/// name : "7 أيام بلا إعلانات"

Offer offerFromJson(String str) => Offer.fromJson(json.decode(str));
String offerToJson(Offer data) => json.encode(data.toJson());
class Offer {
  Offer({
      String? number, 
      String? text, 
      String? name,}){
    _number = number;
    _text = text;
    _name = name;
}

  Offer.fromJson(dynamic json) {
    _number = json['number'];
    _text = json['text'];
    _name = json['name'];
  }
  String? _number;
  String? _text;
  String? _name;

  String? get number => _number;
  String? get text => _text;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = _number;
    map['text'] = _text;
    map['name'] = _name;
    return map;
  }

}

/// title : "(USD4.99) 7 أيام بلا إعلانات"
/// offerText : "0"
/// body : ""

HomeDetails homeDetailsFromJson(String str) => HomeDetails.fromJson(json.decode(str));
String homeDetailsToJson(HomeDetails data) => json.encode(data.toJson());
class HomeDetails {
  HomeDetails({
      String? title, 
      String? offerText, 
      String? body,}){
    _title = title;
    _offerText = offerText;
    _body = body;
}

  HomeDetails.fromJson(dynamic json) {
    _title = json['title'];
    _offerText = json['offerText'];
    _body = json['body'];
  }
  String? _title;
  String? _offerText;
  String? _body;

  String? get title => _title;
  String? get offerText => _offerText;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['offerText'] = _offerText;
    map['body'] = _body;
    return map;
  }

}

/// promote : 1
/// home_details : {"title":"(USD30) اشترك الآن بنصف السعر!","offerText":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","body":"اغتنم الفرصة واشترك الآن بنصف السعر فقط"}
/// offer : {"number":"وفر 50٪","text":"<p style=\"text-align: center;\"><big><strong><span style=\"font-size: 20px;\"><span style=\"font-family: Dubai-Bold;\"><span style=\"color: #FFFFFF;\">بنصف السعر فقط<span><span></span></strong></big><br><span style=\"font-family: Dubai-Regular;\"><span style=\"font-size: 14px;\"><span style=\"color: #FFFFFF;\">عرض خاص و لمدة محدودة</span></span></span></p>","name":"اشترك الآن بنصف السعر!"}
/// price_object : {"offer":false,"regular_price":60,"offer_price":30,"currency":"USD"}
/// duration_object : {"number":"360","name":"سنوياً"}
/// currency : "USD"
/// sku_code : "com.spacetoon.spacetoongo.sub.oneyear.noads.50discount"
/// duration : "360"
/// id : "19"

Promote promoteFromJson(String str) => Promote.fromJson(json.decode(str));
String promoteToJson(Promote data) => json.encode(data.toJson());
class Promote {
  Promote({
      num? promote, 
      HomeDetails? homeDetails, 
      Offer? offer, 
      PriceObject? priceObject, 
      DurationObject? durationObject, 
      String? currency, 
      String? skuCode, 
      String? duration, 
      String? id,}){
    _promote = promote;
    _homeDetails = homeDetails;
    _offer = offer;
    _priceObject = priceObject;
    _durationObject = durationObject;
    _currency = currency;
    _skuCode = skuCode;
    _duration = duration;
    _id = id;
}

  Promote.fromJson(dynamic json) {
    _promote = json['promote'];
    _homeDetails = json['home_details'] != null ? HomeDetails.fromJson(json['home_details']) : null;
    _offer = json['offer'] != null ? Offer.fromJson(json['offer']) : null;
    _priceObject = json['price_object'] != null ? PriceObject.fromJson(json['price_object']) : null;
    _durationObject = json['duration_object'] != null ? DurationObject.fromJson(json['duration_object']) : null;
    _currency = json['currency'];
    _skuCode = json['sku_code'];
    _duration = json['duration'];
    _id = json['id'];
  }
  num? _promote;
  HomeDetails? _homeDetails;
  Offer? _offer;
  PriceObject? _priceObject;
  DurationObject? _durationObject;
  String? _currency;
  String? _skuCode;
  String? _duration;
  String? _id;

  num? get promote => _promote;
  HomeDetails? get homeDetails => _homeDetails;
  Offer? get offer => _offer;
  PriceObject? get priceObject => _priceObject;
  DurationObject? get durationObject => _durationObject;
  String? get currency => _currency;
  String? get skuCode => _skuCode;
  String? get duration => _duration;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['promote'] = _promote;
    if (_homeDetails != null) {
      map['home_details'] = _homeDetails?.toJson();
    }
    if (_offer != null) {
      map['offer'] = _offer?.toJson();
    }
    if (_priceObject != null) {
      map['price_object'] = _priceObject?.toJson();
    }
    if (_durationObject != null) {
      map['duration_object'] = _durationObject?.toJson();
    }
    map['currency'] = _currency;
    map['sku_code'] = _skuCode;
    map['duration'] = _duration;
    map['id'] = _id;
    return map;
  }

}

/// name : "Wajdi i"
/// gender : "M"

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));
String profileToJson(Profile data) => json.encode(data.toJson());
class Profile {
  Profile({
      String? name, 
      String? gender,}){
    _name = name;
    _gender = gender;
}

  Profile.fromJson(dynamic json) {
    _name = json['name'];
    _gender = json['gender'];
  }
  String? _name;
  String? _gender;

  String? get name => _name;
  String? get gender => _gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['gender'] = _gender;
    return map;
  }

}