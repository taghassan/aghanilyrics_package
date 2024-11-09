import 'dart:convert';
/// sid : "61083"
/// session_key : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXByZWNhdGVkSWQiOiI2MTA4MyIsImFjY291bnRJZCI6ImU5YWQwY2E5LTY3MjAtNDgzOS05MGQ1LTg5MjU5NWE3YjQzYSIsInRva2VuIjpudWxsLCJkZXZpY2UiOm51bGwsImZjbVRva2VuIjpudWxsLCJhcG5Ub2tlbiI6bnVsbCwidHRsIjoiMjAyNC0xMS0wOVQxMzo0NzoyMy44OThaIiwiaWF0IjoxNzMxMTYwMDQzLCJleHAiOjE3Mzg5MzYwNDN9.juo7BPOtYlAlH-DzJ2VoBCFi_DRZuKxLXOLX5ZFOm_k"

SpastoonSessionResponseModel spastoonSessionResponseModelFromJson(String str) => SpastoonSessionResponseModel.fromJson(json.decode(str));
String spastoonSessionResponseModelToJson(SpastoonSessionResponseModel data) => json.encode(data.toJson());
class SpastoonSessionResponseModel {
  SpastoonSessionResponseModel({
      String? sid, 
      String? sessionKey,}){
    _sid = sid;
    _sessionKey = sessionKey;
}

  SpastoonSessionResponseModel.fromJson(dynamic json) {
    _sid = json['sid'];
    _sessionKey = json['session_key'];
  }
  String? _sid;
  String? _sessionKey;

  String? get sid => _sid;
  String? get sessionKey => _sessionKey;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sid'] = _sid;
    map['session_key'] = _sessionKey;
    return map;
  }

}