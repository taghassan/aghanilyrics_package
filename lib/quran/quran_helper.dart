import 'package:aghanilyrics/quran/models/ChapterModel.dart';
import 'package:aghanilyrics/quran/models/LanguagesModel.dart';
import 'package:aghanilyrics/quran/models/RecitationsModel.dart';
import 'package:aghanilyrics/quran/models/TranslationsModel.dart';
import 'package:aghanilyrics/quran/models/VersesModel.dart';
import 'package:dio/dio.dart';

class QuranHelper{
  final Dio _client=Dio(
    BaseOptions(
      baseUrl:  "https://api.quran.com/api/v4/",
      responseType: ResponseType.json
    )
  )..interceptors.add(LogInterceptor(
  request: true,
  responseBody: true,
  requestHeader: true,
  error: true,
  requestBody: true,
  responseHeader: true,
  ));




  Future<ChapterModel> getAllChapters({String? languageCode}) async {
    try {
      var response = await _client.get(
          "/chapters?language=${languageCode ?? 'ar'}");
      return ChapterModel.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<RecitationsModel> getAllRecitations({String? languageCode}) async {
    try {
      var response = await _client.get(
          "/resources/recitations?language=${languageCode ?? 'ar'}");
      return RecitationsModel.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
  Future<TranslationsModel> getAllTranslations() async {
    try {
      var response = await _client.get(
          "/resources/translations");
      return TranslationsModel.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<LanguagesModel> getAllLanguages() async {
    try {
      var response = await _client.get(
          "/resources/languages");
      return LanguagesModel.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<VersesModel> getAllVersesByChapter(int chapterId,String translations,String tafsirs,int recitation,int currntPage,{String? languageCode}) async {
    //
    try {
      var response = await _client.get(
          "/verses/by_chapter/$chapterId?words=true&page=$currntPage&per_page=500&word_fields=text_uthmani&translation_fields=text_uthmani&audio=$recitation&tafsirs=$tafsirs&fields=text_uthmani&translations=$translations&language=${languageCode ?? 'ar'}");
      return VersesModel.fromJson(response.data);
    } on DioException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

}
