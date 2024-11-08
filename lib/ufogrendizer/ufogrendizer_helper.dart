import 'package:aghanilyrics/logger_helper.dart';
import 'package:aghanilyrics/ufogrendizer/models/EpisodeInfoResponse.dart';
import 'package:aghanilyrics/ufogrendizer/models/EpisodesResponseModel.dart';
import 'package:aghanilyrics/ufogrendizer/models/TvShowsResponseModel.dart';
import 'package:dio/dio.dart';

enum TvShowFetchType {
  all,
  top,
  recent,
}

class UfoGrendizerHelper with LoggerHelper {
  Dio client = Dio(BaseOptions(baseUrl: "https://ufogrendizer.tv"));

  Future<List<TvShowsResponseModel>> fetchTvShows(
      {TvShowFetchType type = TvShowFetchType.all}) async {
    try {
      String path = 'tvshows';
      switch (type) {
        case TvShowFetchType.all:
          path = 'tvshows';
        case TvShowFetchType.top:
          path = 'toptvshows';
        case TvShowFetchType.recent:
          path = 'recenttvshows';
      }
      var response = await client.get("/api/$path");
// logInfo(response.data.toString() );
      return (response.data??[]).map<TvShowsResponseModel>((e) => TvShowsResponseModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<EpisodesResponseModel>> fetchEpisodes({num? id}) async {
    try {
      var response = await client.get("/api/episodes?id=$id");

      return (response.data??[]).map<EpisodesResponseModel>((e) => EpisodesResponseModel.fromJson(e)).toList();
    } catch (e) {
      logError(e.toString());
      rethrow;
    }
  }

  Future<EpisodeInfoResponse> fetchEpisodeInfo({num? episodeId})async{
    try {
      var response = await client.get("/api/episode?episodeId=$episodeId");

      return EpisodeInfoResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }


}
