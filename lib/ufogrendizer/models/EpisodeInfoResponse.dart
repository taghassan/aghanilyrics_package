import 'dart:convert';
/// messageEntity : {"flags":2147840,"out":false,"mentioned":false,"mediaUnread":false,"silent":false,"post":true,"fromScheduled":false,"legacy":false,"editHide":true,"pinned":false,"noforwards":false,"invertMedia":false,"flags2":0,"offline":false,"id":3033,"fromId":null,"fromBoostsApplied":null,"peerId":{"channelId":"1525582348","className":"PeerChannel"},"savedPeerId":null,"fwdFrom":null,"viaBotId":null,"viaBusinessBotId":null,"replyTo":null,"date":1691440287,"message":"ماروكو الصغيرة الجزء الثاني - الحلقة السابعة وسبعون - تخطي الشارة 1:26","media":{"flags":65,"nopremium":false,"spoiler":false,"video":true,"round":false,"voice":false,"document":{"flags":1,"id":"5949429315924921391","accessHash":"3242490962561033754","fileReference":{"type":"Buffer","data":[2,90,238,138,12,0,0,11,217,103,45,252,75,168,87,17,74,76,75,180,35,239,45,58,47,122,199,38,165]},"date":1691440287,"mimeType":"video/mp4","size":"269649678","thumbs":[{"type":"m","w":320,"h":180,"size":644,"className":"PhotoSize"}],"videoThumbs":null,"dcId":4,"attributes":[{"flags":2,"roundMessage":false,"supportsStreaming":true,"nosound":false,"duration":1304.92,"w":1918,"h":1080,"preloadPrefixSize":null,"className":"DocumentAttributeVideo"},{"fileName":"77.mp4","className":"DocumentAttributeFilename"}],"className":"Document"},"altDocument":null,"ttlSeconds":null,"className":"MessageMediaDocument"},"replyMarkup":null,"entities":null,"views":11381,"forwards":15,"replies":null,"editDate":1691440685,"postAuthor":null,"groupedId":null,"reactions":null,"restrictionReason":null,"ttlPeriod":null,"quickReplyShortcutId":null,"effect":null,"factcheck":null,"className":"Message"}
/// streamUrl : "https://tg.ufogrendizer.tv/stream/3033.mp4?hash=57815f45f506048"
/// next_epid : null
/// prev_epid : null
/// next_ep_title : null
/// prev_ep_title : null

EpisodeInfoResponse episodeInfoResponseFromJson(String str) => EpisodeInfoResponse.fromJson(json.decode(str));
String episodeInfoResponseToJson(EpisodeInfoResponse data) => json.encode(data.toJson());
class EpisodeInfoResponse {
  EpisodeInfoResponse({
      MessageEntity? messageEntity, 
      String? streamUrl, 
      dynamic nextEpid, 
      dynamic prevEpid, 
      dynamic nextEpTitle, 
      dynamic prevEpTitle,}){
    _messageEntity = messageEntity;
    _streamUrl = streamUrl;
    _nextEpid = nextEpid;
    _prevEpid = prevEpid;
    _nextEpTitle = nextEpTitle;
    _prevEpTitle = prevEpTitle;
}

  EpisodeInfoResponse.fromJson(dynamic json) {
    _messageEntity = json['messageEntity'] != null ? MessageEntity.fromJson(json['messageEntity']) : null;
    _streamUrl = json['streamUrl'];
    _nextEpid = json['next_epid'];
    _prevEpid = json['prev_epid'];
    _nextEpTitle = json['next_ep_title'];
    _prevEpTitle = json['prev_ep_title'];
  }
  MessageEntity? _messageEntity;
  String? _streamUrl;
  dynamic _nextEpid;
  dynamic _prevEpid;
  dynamic _nextEpTitle;
  dynamic _prevEpTitle;

  MessageEntity? get messageEntity => _messageEntity;
  String? get streamUrl => _streamUrl;
  dynamic get nextEpid => _nextEpid;
  dynamic get prevEpid => _prevEpid;
  dynamic get nextEpTitle => _nextEpTitle;
  dynamic get prevEpTitle => _prevEpTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_messageEntity != null) {
      map['messageEntity'] = _messageEntity?.toJson();
    }
    map['streamUrl'] = _streamUrl;
    map['next_epid'] = _nextEpid;
    map['prev_epid'] = _prevEpid;
    map['next_ep_title'] = _nextEpTitle;
    map['prev_ep_title'] = _prevEpTitle;
    return map;
  }

}

/// flags : 2147840
/// out : false
/// mentioned : false
/// mediaUnread : false
/// silent : false
/// post : true
/// fromScheduled : false
/// legacy : false
/// editHide : true
/// pinned : false
/// noforwards : false
/// invertMedia : false
/// flags2 : 0
/// offline : false
/// id : 3033
/// fromId : null
/// fromBoostsApplied : null
/// peerId : {"channelId":"1525582348","className":"PeerChannel"}
/// savedPeerId : null
/// fwdFrom : null
/// viaBotId : null
/// viaBusinessBotId : null
/// replyTo : null
/// date : 1691440287
/// message : "ماروكو الصغيرة الجزء الثاني - الحلقة السابعة وسبعون - تخطي الشارة 1:26"
/// media : {"flags":65,"nopremium":false,"spoiler":false,"video":true,"round":false,"voice":false,"document":{"flags":1,"id":"5949429315924921391","accessHash":"3242490962561033754","fileReference":{"type":"Buffer","data":[2,90,238,138,12,0,0,11,217,103,45,252,75,168,87,17,74,76,75,180,35,239,45,58,47,122,199,38,165]},"date":1691440287,"mimeType":"video/mp4","size":"269649678","thumbs":[{"type":"m","w":320,"h":180,"size":644,"className":"PhotoSize"}],"videoThumbs":null,"dcId":4,"attributes":[{"flags":2,"roundMessage":false,"supportsStreaming":true,"nosound":false,"duration":1304.92,"w":1918,"h":1080,"preloadPrefixSize":null,"className":"DocumentAttributeVideo"},{"fileName":"77.mp4","className":"DocumentAttributeFilename"}],"className":"Document"},"altDocument":null,"ttlSeconds":null,"className":"MessageMediaDocument"}
/// replyMarkup : null
/// entities : null
/// views : 11381
/// forwards : 15
/// replies : null
/// editDate : 1691440685
/// postAuthor : null
/// groupedId : null
/// reactions : null
/// restrictionReason : null
/// ttlPeriod : null
/// quickReplyShortcutId : null
/// effect : null
/// factcheck : null
/// className : "Message"

MessageEntity messageEntityFromJson(String str) => MessageEntity.fromJson(json.decode(str));
String messageEntityToJson(MessageEntity data) => json.encode(data.toJson());
class MessageEntity {
  MessageEntity({
      num? flags, 
      bool? out, 
      bool? mentioned, 
      bool? mediaUnread, 
      bool? silent, 
      bool? post, 
      bool? fromScheduled, 
      bool? legacy, 
      bool? editHide, 
      bool? pinned, 
      bool? noforwards, 
      bool? invertMedia, 
      num? flags2, 
      bool? offline, 
      num? id, 
      dynamic fromId, 
      dynamic fromBoostsApplied, 
      PeerId? peerId, 
      dynamic savedPeerId, 
      dynamic fwdFrom, 
      dynamic viaBotId, 
      dynamic viaBusinessBotId, 
      dynamic replyTo, 
      num? date, 
      String? message, 
      Media? media, 
      dynamic replyMarkup, 
      dynamic entities, 
      num? views, 
      num? forwards, 
      dynamic replies, 
      num? editDate, 
      dynamic postAuthor, 
      dynamic groupedId, 
      dynamic reactions, 
      dynamic restrictionReason, 
      dynamic ttlPeriod, 
      dynamic quickReplyShortcutId, 
      dynamic effect, 
      dynamic factcheck, 
      String? className,}){
    _flags = flags;
    _out = out;
    _mentioned = mentioned;
    _mediaUnread = mediaUnread;
    _silent = silent;
    _post = post;
    _fromScheduled = fromScheduled;
    _legacy = legacy;
    _editHide = editHide;
    _pinned = pinned;
    _noforwards = noforwards;
    _invertMedia = invertMedia;
    _flags2 = flags2;
    _offline = offline;
    _id = id;
    _fromId = fromId;
    _fromBoostsApplied = fromBoostsApplied;
    _peerId = peerId;
    _savedPeerId = savedPeerId;
    _fwdFrom = fwdFrom;
    _viaBotId = viaBotId;
    _viaBusinessBotId = viaBusinessBotId;
    _replyTo = replyTo;
    _date = date;
    _message = message;
    _media = media;
    _replyMarkup = replyMarkup;
    _entities = entities;
    _views = views;
    _forwards = forwards;
    _replies = replies;
    _editDate = editDate;
    _postAuthor = postAuthor;
    _groupedId = groupedId;
    _reactions = reactions;
    _restrictionReason = restrictionReason;
    _ttlPeriod = ttlPeriod;
    _quickReplyShortcutId = quickReplyShortcutId;
    _effect = effect;
    _factcheck = factcheck;
    _className = className;
}

  MessageEntity.fromJson(dynamic json) {
    _flags = json['flags'];
    _out = json['out'];
    _mentioned = json['mentioned'];
    _mediaUnread = json['mediaUnread'];
    _silent = json['silent'];
    _post = json['post'];
    _fromScheduled = json['fromScheduled'];
    _legacy = json['legacy'];
    _editHide = json['editHide'];
    _pinned = json['pinned'];
    _noforwards = json['noforwards'];
    _invertMedia = json['invertMedia'];
    _flags2 = json['flags2'];
    _offline = json['offline'];
    _id = json['id'];
    _fromId = json['fromId'];
    _fromBoostsApplied = json['fromBoostsApplied'];
    _peerId = json['peerId'] != null ? PeerId.fromJson(json['peerId']) : null;
    _savedPeerId = json['savedPeerId'];
    _fwdFrom = json['fwdFrom'];
    _viaBotId = json['viaBotId'];
    _viaBusinessBotId = json['viaBusinessBotId'];
    _replyTo = json['replyTo'];
    _date = json['date'];
    _message = json['message'];
    _media = json['media'] != null ? Media.fromJson(json['media']) : null;
    _replyMarkup = json['replyMarkup'];
    _entities = json['entities'];
    _views = json['views'];
    _forwards = json['forwards'];
    _replies = json['replies'];
    _editDate = json['editDate'];
    _postAuthor = json['postAuthor'];
    _groupedId = json['groupedId'];
    _reactions = json['reactions'];
    _restrictionReason = json['restrictionReason'];
    _ttlPeriod = json['ttlPeriod'];
    _quickReplyShortcutId = json['quickReplyShortcutId'];
    _effect = json['effect'];
    _factcheck = json['factcheck'];
    _className = json['className'];
  }
  num? _flags;
  bool? _out;
  bool? _mentioned;
  bool? _mediaUnread;
  bool? _silent;
  bool? _post;
  bool? _fromScheduled;
  bool? _legacy;
  bool? _editHide;
  bool? _pinned;
  bool? _noforwards;
  bool? _invertMedia;
  num? _flags2;
  bool? _offline;
  num? _id;
  dynamic _fromId;
  dynamic _fromBoostsApplied;
  PeerId? _peerId;
  dynamic _savedPeerId;
  dynamic _fwdFrom;
  dynamic _viaBotId;
  dynamic _viaBusinessBotId;
  dynamic _replyTo;
  num? _date;
  String? _message;
  Media? _media;
  dynamic _replyMarkup;
  dynamic _entities;
  num? _views;
  num? _forwards;
  dynamic _replies;
  num? _editDate;
  dynamic _postAuthor;
  dynamic _groupedId;
  dynamic _reactions;
  dynamic _restrictionReason;
  dynamic _ttlPeriod;
  dynamic _quickReplyShortcutId;
  dynamic _effect;
  dynamic _factcheck;
  String? _className;

  num? get flags => _flags;
  bool? get out => _out;
  bool? get mentioned => _mentioned;
  bool? get mediaUnread => _mediaUnread;
  bool? get silent => _silent;
  bool? get post => _post;
  bool? get fromScheduled => _fromScheduled;
  bool? get legacy => _legacy;
  bool? get editHide => _editHide;
  bool? get pinned => _pinned;
  bool? get noforwards => _noforwards;
  bool? get invertMedia => _invertMedia;
  num? get flags2 => _flags2;
  bool? get offline => _offline;
  num? get id => _id;
  dynamic get fromId => _fromId;
  dynamic get fromBoostsApplied => _fromBoostsApplied;
  PeerId? get peerId => _peerId;
  dynamic get savedPeerId => _savedPeerId;
  dynamic get fwdFrom => _fwdFrom;
  dynamic get viaBotId => _viaBotId;
  dynamic get viaBusinessBotId => _viaBusinessBotId;
  dynamic get replyTo => _replyTo;
  num? get date => _date;
  String? get message => _message;
  Media? get media => _media;
  dynamic get replyMarkup => _replyMarkup;
  dynamic get entities => _entities;
  num? get views => _views;
  num? get forwards => _forwards;
  dynamic get replies => _replies;
  num? get editDate => _editDate;
  dynamic get postAuthor => _postAuthor;
  dynamic get groupedId => _groupedId;
  dynamic get reactions => _reactions;
  dynamic get restrictionReason => _restrictionReason;
  dynamic get ttlPeriod => _ttlPeriod;
  dynamic get quickReplyShortcutId => _quickReplyShortcutId;
  dynamic get effect => _effect;
  dynamic get factcheck => _factcheck;
  String? get className => _className;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flags'] = _flags;
    map['out'] = _out;
    map['mentioned'] = _mentioned;
    map['mediaUnread'] = _mediaUnread;
    map['silent'] = _silent;
    map['post'] = _post;
    map['fromScheduled'] = _fromScheduled;
    map['legacy'] = _legacy;
    map['editHide'] = _editHide;
    map['pinned'] = _pinned;
    map['noforwards'] = _noforwards;
    map['invertMedia'] = _invertMedia;
    map['flags2'] = _flags2;
    map['offline'] = _offline;
    map['id'] = _id;
    map['fromId'] = _fromId;
    map['fromBoostsApplied'] = _fromBoostsApplied;
    if (_peerId != null) {
      map['peerId'] = _peerId?.toJson();
    }
    map['savedPeerId'] = _savedPeerId;
    map['fwdFrom'] = _fwdFrom;
    map['viaBotId'] = _viaBotId;
    map['viaBusinessBotId'] = _viaBusinessBotId;
    map['replyTo'] = _replyTo;
    map['date'] = _date;
    map['message'] = _message;
    if (_media != null) {
      map['media'] = _media?.toJson();
    }
    map['replyMarkup'] = _replyMarkup;
    map['entities'] = _entities;
    map['views'] = _views;
    map['forwards'] = _forwards;
    map['replies'] = _replies;
    map['editDate'] = _editDate;
    map['postAuthor'] = _postAuthor;
    map['groupedId'] = _groupedId;
    map['reactions'] = _reactions;
    map['restrictionReason'] = _restrictionReason;
    map['ttlPeriod'] = _ttlPeriod;
    map['quickReplyShortcutId'] = _quickReplyShortcutId;
    map['effect'] = _effect;
    map['factcheck'] = _factcheck;
    map['className'] = _className;
    return map;
  }

}

/// flags : 65
/// nopremium : false
/// spoiler : false
/// video : true
/// round : false
/// voice : false
/// document : {"flags":1,"id":"5949429315924921391","accessHash":"3242490962561033754","fileReference":{"type":"Buffer","data":[2,90,238,138,12,0,0,11,217,103,45,252,75,168,87,17,74,76,75,180,35,239,45,58,47,122,199,38,165]},"date":1691440287,"mimeType":"video/mp4","size":"269649678","thumbs":[{"type":"m","w":320,"h":180,"size":644,"className":"PhotoSize"}],"videoThumbs":null,"dcId":4,"attributes":[{"flags":2,"roundMessage":false,"supportsStreaming":true,"nosound":false,"duration":1304.92,"w":1918,"h":1080,"preloadPrefixSize":null,"className":"DocumentAttributeVideo"},{"fileName":"77.mp4","className":"DocumentAttributeFilename"}],"className":"Document"}
/// altDocument : null
/// ttlSeconds : null
/// className : "MessageMediaDocument"

Media mediaFromJson(String str) => Media.fromJson(json.decode(str));
String mediaToJson(Media data) => json.encode(data.toJson());
class Media {
  Media({
      num? flags, 
      bool? nopremium, 
      bool? spoiler, 
      bool? video, 
      bool? round, 
      bool? voice, 
      Document? document, 
      dynamic altDocument, 
      dynamic ttlSeconds, 
      String? className,}){
    _flags = flags;
    _nopremium = nopremium;
    _spoiler = spoiler;
    _video = video;
    _round = round;
    _voice = voice;
    _document = document;
    _altDocument = altDocument;
    _ttlSeconds = ttlSeconds;
    _className = className;
}

  Media.fromJson(dynamic json) {
    _flags = json['flags'];
    _nopremium = json['nopremium'];
    _spoiler = json['spoiler'];
    _video = json['video'];
    _round = json['round'];
    _voice = json['voice'];
    _document = json['document'] != null ? Document.fromJson(json['document']) : null;
    _altDocument = json['altDocument'];
    _ttlSeconds = json['ttlSeconds'];
    _className = json['className'];
  }
  num? _flags;
  bool? _nopremium;
  bool? _spoiler;
  bool? _video;
  bool? _round;
  bool? _voice;
  Document? _document;
  dynamic _altDocument;
  dynamic _ttlSeconds;
  String? _className;

  num? get flags => _flags;
  bool? get nopremium => _nopremium;
  bool? get spoiler => _spoiler;
  bool? get video => _video;
  bool? get round => _round;
  bool? get voice => _voice;
  Document? get document => _document;
  dynamic get altDocument => _altDocument;
  dynamic get ttlSeconds => _ttlSeconds;
  String? get className => _className;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flags'] = _flags;
    map['nopremium'] = _nopremium;
    map['spoiler'] = _spoiler;
    map['video'] = _video;
    map['round'] = _round;
    map['voice'] = _voice;
    if (_document != null) {
      map['document'] = _document?.toJson();
    }
    map['altDocument'] = _altDocument;
    map['ttlSeconds'] = _ttlSeconds;
    map['className'] = _className;
    return map;
  }

}

/// flags : 1
/// id : "5949429315924921391"
/// accessHash : "3242490962561033754"
/// fileReference : {"type":"Buffer","data":[2,90,238,138,12,0,0,11,217,103,45,252,75,168,87,17,74,76,75,180,35,239,45,58,47,122,199,38,165]}
/// date : 1691440287
/// mimeType : "video/mp4"
/// size : "269649678"
/// thumbs : [{"type":"m","w":320,"h":180,"size":644,"className":"PhotoSize"}]
/// videoThumbs : null
/// dcId : 4
/// attributes : [{"flags":2,"roundMessage":false,"supportsStreaming":true,"nosound":false,"duration":1304.92,"w":1918,"h":1080,"preloadPrefixSize":null,"className":"DocumentAttributeVideo"},{"fileName":"77.mp4","className":"DocumentAttributeFilename"}]
/// className : "Document"

Document documentFromJson(String str) => Document.fromJson(json.decode(str));
String documentToJson(Document data) => json.encode(data.toJson());
class Document {
  Document({
      num? flags, 
      String? id, 
      String? accessHash, 
      FileReference? fileReference, 
      num? date, 
      String? mimeType, 
      String? size, 
      List<Thumbs>? thumbs, 
      dynamic videoThumbs, 
      num? dcId, 
      List<Attributes>? attributes, 
      String? className,}){
    _flags = flags;
    _id = id;
    _accessHash = accessHash;
    _fileReference = fileReference;
    _date = date;
    _mimeType = mimeType;
    _size = size;
    _thumbs = thumbs;
    _videoThumbs = videoThumbs;
    _dcId = dcId;
    _attributes = attributes;
    _className = className;
}

  Document.fromJson(dynamic json) {
    _flags = json['flags'];
    _id = json['id'];
    _accessHash = json['accessHash'];
    _fileReference = json['fileReference'] != null ? FileReference.fromJson(json['fileReference']) : null;
    _date = json['date'];
    _mimeType = json['mimeType'];
    _size = json['size'];
    if (json['thumbs'] != null) {
      _thumbs = [];
      json['thumbs'].forEach((v) {
        _thumbs?.add(Thumbs.fromJson(v));
      });
    }
    _videoThumbs = json['videoThumbs'];
    _dcId = json['dcId'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(Attributes.fromJson(v));
      });
    }
    _className = json['className'];
  }
  num? _flags;
  String? _id;
  String? _accessHash;
  FileReference? _fileReference;
  num? _date;
  String? _mimeType;
  String? _size;
  List<Thumbs>? _thumbs;
  dynamic _videoThumbs;
  num? _dcId;
  List<Attributes>? _attributes;
  String? _className;

  num? get flags => _flags;
  String? get id => _id;
  String? get accessHash => _accessHash;
  FileReference? get fileReference => _fileReference;
  num? get date => _date;
  String? get mimeType => _mimeType;
  String? get size => _size;
  List<Thumbs>? get thumbs => _thumbs;
  dynamic get videoThumbs => _videoThumbs;
  num? get dcId => _dcId;
  List<Attributes>? get attributes => _attributes;
  String? get className => _className;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flags'] = _flags;
    map['id'] = _id;
    map['accessHash'] = _accessHash;
    if (_fileReference != null) {
      map['fileReference'] = _fileReference?.toJson();
    }
    map['date'] = _date;
    map['mimeType'] = _mimeType;
    map['size'] = _size;
    if (_thumbs != null) {
      map['thumbs'] = _thumbs?.map((v) => v.toJson()).toList();
    }
    map['videoThumbs'] = _videoThumbs;
    map['dcId'] = _dcId;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    map['className'] = _className;
    return map;
  }

}

/// flags : 2
/// roundMessage : false
/// supportsStreaming : true
/// nosound : false
/// duration : 1304.92
/// w : 1918
/// h : 1080
/// preloadPrefixSize : null
/// className : "DocumentAttributeVideo"

Attributes attributesFromJson(String str) => Attributes.fromJson(json.decode(str));
String attributesToJson(Attributes data) => json.encode(data.toJson());
class Attributes {
  Attributes({
      num? flags, 
      bool? roundMessage, 
      bool? supportsStreaming, 
      bool? nosound, 
      num? duration, 
      num? w, 
      num? h, 
      dynamic preloadPrefixSize, 
      String? className,}){
    _flags = flags;
    _roundMessage = roundMessage;
    _supportsStreaming = supportsStreaming;
    _nosound = nosound;
    _duration = duration;
    _w = w;
    _h = h;
    _preloadPrefixSize = preloadPrefixSize;
    _className = className;
}

  Attributes.fromJson(dynamic json) {
    _flags = json['flags'];
    _roundMessage = json['roundMessage'];
    _supportsStreaming = json['supportsStreaming'];
    _nosound = json['nosound'];
    _duration = json['duration'];
    _w = json['w'];
    _h = json['h'];
    _preloadPrefixSize = json['preloadPrefixSize'];
    _className = json['className'];
  }
  num? _flags;
  bool? _roundMessage;
  bool? _supportsStreaming;
  bool? _nosound;
  num? _duration;
  num? _w;
  num? _h;
  dynamic _preloadPrefixSize;
  String? _className;

  num? get flags => _flags;
  bool? get roundMessage => _roundMessage;
  bool? get supportsStreaming => _supportsStreaming;
  bool? get nosound => _nosound;
  num? get duration => _duration;
  num? get w => _w;
  num? get h => _h;
  dynamic get preloadPrefixSize => _preloadPrefixSize;
  String? get className => _className;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['flags'] = _flags;
    map['roundMessage'] = _roundMessage;
    map['supportsStreaming'] = _supportsStreaming;
    map['nosound'] = _nosound;
    map['duration'] = _duration;
    map['w'] = _w;
    map['h'] = _h;
    map['preloadPrefixSize'] = _preloadPrefixSize;
    map['className'] = _className;
    return map;
  }

}

/// type : "m"
/// w : 320
/// h : 180
/// size : 644
/// className : "PhotoSize"

Thumbs thumbsFromJson(String str) => Thumbs.fromJson(json.decode(str));
String thumbsToJson(Thumbs data) => json.encode(data.toJson());
class Thumbs {
  Thumbs({
      String? type, 
      num? w, 
      num? h, 
      num? size, 
      String? className,}){
    _type = type;
    _w = w;
    _h = h;
    _size = size;
    _className = className;
}

  Thumbs.fromJson(dynamic json) {
    _type = json['type'];
    _w = json['w'];
    _h = json['h'];
    _size = json['size'];
    _className = json['className'];
  }
  String? _type;
  num? _w;
  num? _h;
  num? _size;
  String? _className;

  String? get type => _type;
  num? get w => _w;
  num? get h => _h;
  num? get size => _size;
  String? get className => _className;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['w'] = _w;
    map['h'] = _h;
    map['size'] = _size;
    map['className'] = _className;
    return map;
  }

}

/// type : "Buffer"
/// data : [2,90,238,138,12,0,0,11,217,103,45,252,75,168,87,17,74,76,75,180,35,239,45,58,47,122,199,38,165]

FileReference fileReferenceFromJson(String str) => FileReference.fromJson(json.decode(str));
String fileReferenceToJson(FileReference data) => json.encode(data.toJson());
class FileReference {
  FileReference({
      String? type, 
      List<num>? data,}){
    _type = type;
    _data = data;
}

  FileReference.fromJson(dynamic json) {
    _type = json['type'];
    _data = json['data'] != null ? json['data'].cast<num>() : [];
  }
  String? _type;
  List<num>? _data;

  String? get type => _type;
  List<num>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['data'] = _data;
    return map;
  }

}

/// channelId : "1525582348"
/// className : "PeerChannel"

PeerId peerIdFromJson(String str) => PeerId.fromJson(json.decode(str));
String peerIdToJson(PeerId data) => json.encode(data.toJson());
class PeerId {
  PeerId({
      String? channelId, 
      String? className,}){
    _channelId = channelId;
    _className = className;
}

  PeerId.fromJson(dynamic json) {
    _channelId = json['channelId'];
    _className = json['className'];
  }
  String? _channelId;
  String? _className;

  String? get channelId => _channelId;
  String? get className => _className;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['channelId'] = _channelId;
    map['className'] = _className;
    return map;
  }

}