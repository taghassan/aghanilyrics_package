import 'dart:convert';
/// id : 134
/// temp_stop : 0
/// kids : 1
/// cast : null
/// region : "MENA"
/// upcoming_date : null
/// upcoming : 0
/// already_fav_it : 0
/// cat : 6
/// planet : 6
/// planet_name : "مغامرات"
/// name : "أنا وأخي"
/// cover_full_path : "https://spacetoon.s.llnwi.net/images/89f44-cover.png"
/// cover : "https://spacetoon.s.llnwi.net/images/89f44-cover.png"
/// trailer : null
/// ep_count : 35
/// pref : "بعد أن توفيت والدتهما وانشغل والدهما بالعمل\r\n تولى سامي مهمة رعاية أخيه الصغير وسيم إكراماً لوصية أمه وحباً بأخيه الصغير."
/// tags : "اناواخي,انا واخي,انا و اخي,سامي,وسيم,أناوأخي,أنا و أخي,كلاسيكيات"
/// min_age : 6
/// w : 0
/// img1_full_path : "https://spacetoon.s.llnwi.net/images/1e7c0-1-.jpg"
/// trailer_cover : "https://spacetoon.s.llnwi.net/images/1e7c0-1-.jpg"
/// trailer_cover_full_path : "https://spacetoon.s.llnwi.net/images/1e7c0-1-.jpg"
/// img2_full_path : null
/// img3_full_path : null
/// cost : "Free"
/// is_movie : 0
/// screen : "4/3"
/// is_completed : 1
/// label : null
/// ep_duration : 20
/// img1 : "https://spacetoon.s.llnwi.net/images/1e7c0-1-.jpg"
/// img2 : null
/// img3 : null
/// is_hot : 0
/// w_hot : 0
/// is_new : 0
/// w_new : 0
/// is_popular : 0
/// w_popular : 0
/// is_top : 0
/// w_top : 0
/// is_zaman : 1
/// w_zaman : 2
/// top_planet : null
/// w_top_planet : 0
/// w_free_top : 0
/// status : 1
/// is_show : 0
/// is_song : 0
/// show_episode_numbers : 1
/// is_episode_limited : 0
/// is_completed_series : 0
/// completed_series_w : 0
/// is_top_songs : 0
/// top_songs_w : 0
/// shareable_link : "https://spacetoongo.com/series/134"
/// views : 254
/// enabled : 1
/// created_at : "2024-08-31T22:30:01.000Z"

SpastoonsTvShowsResponseModel spastoonsTvShowsResponseModelFromJson(String str) => SpastoonsTvShowsResponseModel.fromJson(json.decode(str));
String spastoonsTvShowsResponseModelToJson(SpastoonsTvShowsResponseModel data) => json.encode(data.toJson());
class SpastoonsTvShowsResponseModel {
  SpastoonsTvShowsResponseModel({
      num? id, 
      num? tempStop, 
      num? kids, 
      dynamic cast, 
      String? region, 
      dynamic upcomingDate, 
      num? upcoming, 
      num? alreadyFavIt, 
      num? cat, 
      num? planet, 
      String? planetName, 
      String? name, 
      String? coverFullPath, 
      String? cover, 
      dynamic trailer, 
      num? epCount, 
      String? pref, 
      String? tags, 
      num? minAge, 
      num? w, 
      String? img1FullPath, 
      String? trailerCover, 
      String? trailerCoverFullPath, 
      dynamic img2FullPath, 
      dynamic img3FullPath, 
      String? cost, 
      num? isMovie, 
      String? screen, 
      num? isCompleted, 
      dynamic label, 
      num? epDuration, 
      String? img1, 
      dynamic img2, 
      dynamic img3, 
      num? isHot, 
      num? wHot, 
      num? isNew, 
      num? wNew, 
      num? isPopular, 
      num? wPopular, 
      num? isTop, 
      num? wTop, 
      num? isZaman, 
      num? wZaman, 
      dynamic topPlanet, 
      num? wTopPlanet, 
      num? wFreeTop, 
      num? status, 
      num? isShow, 
      num? isSong, 
      num? showEpisodeNumbers, 
      num? isEpisodeLimited, 
      num? isCompletedSeries, 
      num? completedSeriesW, 
      num? isTopSongs, 
      num? topSongsW, 
      String? shareableLink, 
      num? views, 
      num? enabled, 
      String? createdAt,}){
    _id = id;
    _tempStop = tempStop;
    _kids = kids;
    _cast = cast;
    _region = region;
    _upcomingDate = upcomingDate;
    _upcoming = upcoming;
    _alreadyFavIt = alreadyFavIt;
    _cat = cat;
    _planet = planet;
    _planetName = planetName;
    _name = name;
    _coverFullPath = coverFullPath;
    _cover = cover;
    _trailer = trailer;
    _epCount = epCount;
    _pref = pref;
    _tags = tags;
    _minAge = minAge;
    _w = w;
    _img1FullPath = img1FullPath;
    _trailerCover = trailerCover;
    _trailerCoverFullPath = trailerCoverFullPath;
    _img2FullPath = img2FullPath;
    _img3FullPath = img3FullPath;
    _cost = cost;
    _isMovie = isMovie;
    _screen = screen;
    _isCompleted = isCompleted;
    _label = label;
    _epDuration = epDuration;
    _img1 = img1;
    _img2 = img2;
    _img3 = img3;
    _isHot = isHot;
    _wHot = wHot;
    _isNew = isNew;
    _wNew = wNew;
    _isPopular = isPopular;
    _wPopular = wPopular;
    _isTop = isTop;
    _wTop = wTop;
    _isZaman = isZaman;
    _wZaman = wZaman;
    _topPlanet = topPlanet;
    _wTopPlanet = wTopPlanet;
    _wFreeTop = wFreeTop;
    _status = status;
    _isShow = isShow;
    _isSong = isSong;
    _showEpisodeNumbers = showEpisodeNumbers;
    _isEpisodeLimited = isEpisodeLimited;
    _isCompletedSeries = isCompletedSeries;
    _completedSeriesW = completedSeriesW;
    _isTopSongs = isTopSongs;
    _topSongsW = topSongsW;
    _shareableLink = shareableLink;
    _views = views;
    _enabled = enabled;
    _createdAt = createdAt;
}

  SpastoonsTvShowsResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _tempStop = json['temp_stop'];
    _kids = json['kids'];
    _cast = json['cast'];
    _region = json['region'];
    _upcomingDate = json['upcoming_date'];
    _upcoming = json['upcoming'];
    _alreadyFavIt = json['already_fav_it'];
    _cat = json['cat'];
    _planet = json['planet'];
    _planetName = json['planet_name'];
    _name = json['name'];
    _coverFullPath = json['cover_full_path'];
    _cover = json['cover'];
    _trailer = json['trailer'];
    _epCount = json['ep_count'];
    _pref = json['pref'];
    _tags = json['tags'];
    _minAge = json['min_age'];
    _w = json['w'];
    _img1FullPath = json['img1_full_path'];
    _trailerCover = json['trailer_cover'];
    _trailerCoverFullPath = json['trailer_cover_full_path'];
    _img2FullPath = json['img2_full_path'];
    _img3FullPath = json['img3_full_path'];
    _cost = json['cost'];
    _isMovie = json['is_movie'];
    _screen = json['screen'];
    _isCompleted = json['is_completed'];
    _label = json['label'];
    _epDuration = json['ep_duration'];
    _img1 = json['img1'];
    _img2 = json['img2'];
    _img3 = json['img3'];
    _isHot = json['is_hot'];
    _wHot = json['w_hot'];
    _isNew = json['is_new'];
    _wNew = json['w_new'];
    _isPopular = json['is_popular'];
    _wPopular = json['w_popular'];
    _isTop = json['is_top'];
    _wTop = json['w_top'];
    _isZaman = json['is_zaman'];
    _wZaman = json['w_zaman'];
    _topPlanet = json['top_planet'];
    _wTopPlanet = json['w_top_planet'];
    _wFreeTop = json['w_free_top'];
    _status = json['status'];
    _isShow = json['is_show'];
    _isSong = json['is_song'];
    _showEpisodeNumbers = json['show_episode_numbers'];
    _isEpisodeLimited = json['is_episode_limited'];
    _isCompletedSeries = json['is_completed_series'];
    _completedSeriesW = json['completed_series_w'];
    _isTopSongs = json['is_top_songs'];
    _topSongsW = json['top_songs_w'];
    _shareableLink = json['shareable_link'];
    _views = json['views'];
    _enabled = json['enabled'];
    _createdAt = json['created_at'];
  }
  num? _id;
  num? _tempStop;
  num? _kids;
  dynamic _cast;
  String? _region;
  dynamic _upcomingDate;
  num? _upcoming;
  num? _alreadyFavIt;
  num? _cat;
  num? _planet;
  String? _planetName;
  String? _name;
  String? _coverFullPath;
  String? _cover;
  dynamic _trailer;
  num? _epCount;
  String? _pref;
  String? _tags;
  num? _minAge;
  num? _w;
  String? _img1FullPath;
  String? _trailerCover;
  String? _trailerCoverFullPath;
  dynamic _img2FullPath;
  dynamic _img3FullPath;
  String? _cost;
  num? _isMovie;
  String? _screen;
  num? _isCompleted;
  dynamic _label;
  num? _epDuration;
  String? _img1;
  dynamic _img2;
  dynamic _img3;
  num? _isHot;
  num? _wHot;
  num? _isNew;
  num? _wNew;
  num? _isPopular;
  num? _wPopular;
  num? _isTop;
  num? _wTop;
  num? _isZaman;
  num? _wZaman;
  dynamic _topPlanet;
  num? _wTopPlanet;
  num? _wFreeTop;
  num? _status;
  num? _isShow;
  num? _isSong;
  num? _showEpisodeNumbers;
  num? _isEpisodeLimited;
  num? _isCompletedSeries;
  num? _completedSeriesW;
  num? _isTopSongs;
  num? _topSongsW;
  String? _shareableLink;
  num? _views;
  num? _enabled;
  String? _createdAt;

  num? get id => _id;
  num? get tempStop => _tempStop;
  num? get kids => _kids;
  dynamic get cast => _cast;
  String? get region => _region;
  dynamic get upcomingDate => _upcomingDate;
  num? get upcoming => _upcoming;
  num? get alreadyFavIt => _alreadyFavIt;
  num? get cat => _cat;
  num? get planet => _planet;
  String? get planetName => _planetName;
  String? get name => _name;
  String? get coverFullPath => _coverFullPath;
  String? get cover => _cover;
  dynamic get trailer => _trailer;
  num? get epCount => _epCount;
  String? get pref => _pref;
  String? get tags => _tags;
  num? get minAge => _minAge;
  num? get w => _w;
  String? get img1FullPath => _img1FullPath;
  String? get trailerCover => _trailerCover;
  String? get trailerCoverFullPath => _trailerCoverFullPath;
  dynamic get img2FullPath => _img2FullPath;
  dynamic get img3FullPath => _img3FullPath;
  String? get cost => _cost;
  num? get isMovie => _isMovie;
  String? get screen => _screen;
  num? get isCompleted => _isCompleted;
  dynamic get label => _label;
  num? get epDuration => _epDuration;
  String? get img1 => _img1;
  dynamic get img2 => _img2;
  dynamic get img3 => _img3;
  num? get isHot => _isHot;
  num? get wHot => _wHot;
  num? get isNew => _isNew;
  num? get wNew => _wNew;
  num? get isPopular => _isPopular;
  num? get wPopular => _wPopular;
  num? get isTop => _isTop;
  num? get wTop => _wTop;
  num? get isZaman => _isZaman;
  num? get wZaman => _wZaman;
  dynamic get topPlanet => _topPlanet;
  num? get wTopPlanet => _wTopPlanet;
  num? get wFreeTop => _wFreeTop;
  num? get status => _status;
  num? get isShow => _isShow;
  num? get isSong => _isSong;
  num? get showEpisodeNumbers => _showEpisodeNumbers;
  num? get isEpisodeLimited => _isEpisodeLimited;
  num? get isCompletedSeries => _isCompletedSeries;
  num? get completedSeriesW => _completedSeriesW;
  num? get isTopSongs => _isTopSongs;
  num? get topSongsW => _topSongsW;
  String? get shareableLink => _shareableLink;
  num? get views => _views;
  num? get enabled => _enabled;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['temp_stop'] = _tempStop;
    map['kids'] = _kids;
    map['cast'] = _cast;
    map['region'] = _region;
    map['upcoming_date'] = _upcomingDate;
    map['upcoming'] = _upcoming;
    map['already_fav_it'] = _alreadyFavIt;
    map['cat'] = _cat;
    map['planet'] = _planet;
    map['planet_name'] = _planetName;
    map['name'] = _name;
    map['cover_full_path'] = _coverFullPath;
    map['cover'] = _cover;
    map['trailer'] = _trailer;
    map['ep_count'] = _epCount;
    map['pref'] = _pref;
    map['tags'] = _tags;
    map['min_age'] = _minAge;
    map['w'] = _w;
    map['img1_full_path'] = _img1FullPath;
    map['trailer_cover'] = _trailerCover;
    map['trailer_cover_full_path'] = _trailerCoverFullPath;
    map['img2_full_path'] = _img2FullPath;
    map['img3_full_path'] = _img3FullPath;
    map['cost'] = _cost;
    map['is_movie'] = _isMovie;
    map['screen'] = _screen;
    map['is_completed'] = _isCompleted;
    map['label'] = _label;
    map['ep_duration'] = _epDuration;
    map['img1'] = _img1;
    map['img2'] = _img2;
    map['img3'] = _img3;
    map['is_hot'] = _isHot;
    map['w_hot'] = _wHot;
    map['is_new'] = _isNew;
    map['w_new'] = _wNew;
    map['is_popular'] = _isPopular;
    map['w_popular'] = _wPopular;
    map['is_top'] = _isTop;
    map['w_top'] = _wTop;
    map['is_zaman'] = _isZaman;
    map['w_zaman'] = _wZaman;
    map['top_planet'] = _topPlanet;
    map['w_top_planet'] = _wTopPlanet;
    map['w_free_top'] = _wFreeTop;
    map['status'] = _status;
    map['is_show'] = _isShow;
    map['is_song'] = _isSong;
    map['show_episode_numbers'] = _showEpisodeNumbers;
    map['is_episode_limited'] = _isEpisodeLimited;
    map['is_completed_series'] = _isCompletedSeries;
    map['completed_series_w'] = _completedSeriesW;
    map['is_top_songs'] = _isTopSongs;
    map['top_songs_w'] = _topSongsW;
    map['shareable_link'] = _shareableLink;
    map['views'] = _views;
    map['enabled'] = _enabled;
    map['created_at'] = _createdAt;
    return map;
  }

}