import 'dart:convert';
/// id : 880
/// title : "المحقق كونان : لحن وداع المتحرين"
/// description : "أحد المجرمين يقوم باستئجار توغو موري ليحل قضية محددة لم يذكر تفاصيلها ولكن طلب من موري أن يفعل ذلك عبر تلميحات خاصة! ولإجبار توغو على القيام بذلك قام هذا المجرم بإعطاء ران وباقي أصدقاء كونان ساعات تنفجر في حالة غادروا مدينة الألعاب، يعرف هذا المجرم أن كونان هو سينشي ولكنه لم يره (كون عينيه مصابتان بالعمى) عن طريق جهاز البصمة على يد الكرسي. ينضم هيجي هاتوري وكايتو كيد الذي تنكر بزي هاكوبا ساجورو إلى مساعدة كونان في حل لغز هذه القضية، بعد العديد من التحريات ينجحون في كشف ملابسات القضية ويتوجهون إلى الفندق الذي يوجد فيه المجرم أين ينجحون في النهاية في القبض عليه بعد مجموعة من الصعوبات وهل ينقظون الأطفال وران وكازوها من الانفجار.\n\n"
/// description_technical : "\nالقسم: فيلم مدبلج المحقق كونان\nسنة الإنتاج والعرض: 2006\nنوع الفيلم: أدب بوليسي، دراما، غموض، أفلام الحركة والإثارة\nانتاج شركة: طوكيو موفي شينشا\nالدوبلاج للغة العربية: مركز الزهرة\nعدد الحلقات: 1 حلقة\nمدة الحلقة: 107 دقيقة تقريباً\nالجودة: FULL HD\nالأبعاد: 1920x1080\nصيغة الفيديو والصوت: MP4 , H264 , AAC\nالقائم/القائمين على العمل: UFOGrendizer\nالمصدر: حصري\n\n"
/// poster_banner : "881_banner.webp"
/// poster_cover : "882_cover.webp"
/// poster_cover_alt : "883_cover_alt.webp"
/// category : "فيلم مدبلج المحقق كونان"
/// release_year : "2006"
/// episodes_count : "1 حلقة"
/// episodes_length : "107 دقيقة تقريباً"
/// quality : "FULL HD"
/// youtube_link : ""
/// telegram_link : ""
/// order_id : 194
/// views : 148
/// created_at : "2024-11-02T22:50:20.000Z"
/// episodes_count_real : 1

TvShowsResponseModel tvShowsResponseModelFromJson(String str) => TvShowsResponseModel.fromJson(json.decode(str));
String tvShowsResponseModelToJson(TvShowsResponseModel data) => json.encode(data.toJson());
class TvShowsResponseModel {
  TvShowsResponseModel({
      num? id, 
      String? title, 
      String? description, 
      String? descriptionTechnical, 
      String? posterBanner, 
      String? posterCover, 
      String? posterCoverAlt, 
      String? category, 
      String? releaseYear, 
      String? episodesCount, 
      String? episodesLength, 
      String? quality, 
      String? youtubeLink, 
      String? telegramLink, 
      num? orderId, 
      num? views, 
      String? createdAt, 
      num? episodesCountReal,}){
    _id = id;
    _title = title;
    _description = description;
    _descriptionTechnical = descriptionTechnical;
    _posterBanner = posterBanner;
    _posterCover = posterCover;
    _posterCoverAlt = posterCoverAlt;
    _category = category;
    _releaseYear = releaseYear;
    _episodesCount = episodesCount;
    _episodesLength = episodesLength;
    _quality = quality;
    _youtubeLink = youtubeLink;
    _telegramLink = telegramLink;
    _orderId = orderId;
    _views = views;
    _createdAt = createdAt;
    _episodesCountReal = episodesCountReal;
}

  TvShowsResponseModel.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _descriptionTechnical = json['description_technical'];
    _posterBanner = json['poster_banner'];
    _posterCover = json['poster_cover'];
    _posterCoverAlt = json['poster_cover_alt'];
    _category = json['category'];
    _releaseYear = json['release_year'];
    _episodesCount = json['episodes_count'];
    _episodesLength = json['episodes_length'];
    _quality = json['quality'];
    _youtubeLink = json['youtube_link'];
    _telegramLink = json['telegram_link'];
    _orderId = json['order_id'];
    _views = json['views'];
    _createdAt = json['created_at'];
    _episodesCountReal = json['episodes_count_real'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _descriptionTechnical;
  String? _posterBanner;
  String? _posterCover;
  String? _posterCoverAlt;
  String? _category;
  String? _releaseYear;
  String? _episodesCount;
  String? _episodesLength;
  String? _quality;
  String? _youtubeLink;
  String? _telegramLink;
  num? _orderId;
  num? _views;
  String? _createdAt;
  num? _episodesCountReal;

  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get descriptionTechnical => _descriptionTechnical;
  String? get posterBanner => _posterBanner;
  String? get posterBannerFullUrl => "https://ufogrendizer.tv/assets/img/posters/$_posterBanner" ;
  String? get posterCover => _posterCover;
  String? get posterCoverFullUrl => "https://ufogrendizer.tv/assets/img/posters/$_posterCover" ;
  String? get posterCoverAlt => _posterCoverAlt;
  String? get category => _category;
  String? get releaseYear => _releaseYear;
  String? get episodesCount => _episodesCount;
  String? get episodesLength => _episodesLength;
  String? get quality => _quality;
  String? get youtubeLink => _youtubeLink;
  String? get telegramLink => _telegramLink;
  num? get orderId => _orderId;
  num? get views => _views;
  String? get createdAt => _createdAt;
  num? get episodesCountReal => _episodesCountReal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['description_technical'] = _descriptionTechnical;
    map['poster_banner'] = _posterBanner;
    map['poster_cover'] = _posterCover;
    map['poster_cover_alt'] = _posterCoverAlt;
    map['category'] = _category;
    map['release_year'] = _releaseYear;
    map['episodes_count'] = _episodesCount;
    map['episodes_length'] = _episodesLength;
    map['quality'] = _quality;
    map['youtube_link'] = _youtubeLink;
    map['telegram_link'] = _telegramLink;
    map['order_id'] = _orderId;
    map['views'] = _views;
    map['created_at'] = _createdAt;
    map['episodes_count_real'] = _episodesCountReal;
    return map;
  }

}