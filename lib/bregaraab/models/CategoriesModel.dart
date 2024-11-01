class CategoriesModel {
  /// url : ""
  /// name : ""

  CategoriesModel({
  String? url,
  String? name,}){
  _url = url;
  _name = name;
  }

  CategoriesModel.fromJson(dynamic json) {
  _url = json['url'];
  _name = json['name'];
  }
  String? _url;
  String? _name;
  CategoriesModel copyWith({  String? url,
  String? name,
  }) => CategoriesModel(  url: url ?? _url,
  name: name ?? _name,
  );
  String? get url => _url;
  String? get name => _name;

  Map<String, dynamic> toJson() {
  final map = <String, dynamic>{};
  map['url'] = _url;
  map['name'] = _name;
  return map;
  }

  }