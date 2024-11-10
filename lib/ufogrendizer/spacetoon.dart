part of 'ufogrendizer_helper.dart';

enum SpasToonTvShowFetchType {
  all,
  top,
}

class SpaceToonHelper with LoggerHelper {
  Dio client = Dio(BaseOptions(baseUrl: "https://sp.ufogrendizer.tv"));

  Future<List<SpastoonsTvShowsResponseModel>> fetchSpasToonTvShows(
      {SpasToonTvShowFetchType type = SpasToonTvShowFetchType.all}) async {
    try {
      String path = 'tvshows';
      switch (type) {
        case SpasToonTvShowFetchType.all:
          path = 'tvshows';
        case SpasToonTvShowFetchType.top:
          path = 'toptvshows';
      }
      var response = await client.get("/api/$path");
      logInfo(response.data.toString());
      return (response.data ?? [])
          .map<SpastoonsTvShowsResponseModel>((e) => SpastoonsTvShowsResponseModel.fromJson(e))
          .toList();
    } catch (e) {
      logError(e.toString());
      rethrow;
    }
  }

  //
  Future<List<RecentEpisodesResponseModel>> fetchSpacetoonRecentEpisodes() async {
    try {
      var response = await client.get(
        '/api/recentEpisodes',
      );

      return (response.data ?? [])
          .map<RecentEpisodesResponseModel>(
              (e) => RecentEpisodesResponseModel.fromJson(e))
          .toList();
    } catch (e) {
      logError(e.toString());
      rethrow;
    }
  }  //

  Future<List<SpacetoonEpisodesResponseModel>> fetchSpacetoonEpisodesById(
      {required String id}) async {
    try {
      var response = await client.get(
        '/api/episodes?id=$id',
      );
      return (response.data ?? [])
          .map<SpacetoonEpisodesResponseModel>(
              (e) => SpacetoonEpisodesResponseModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<GetEpisodeLinkResponseModel>  getEpisodeLink({required String epId})async{

    try{

      var response = await client.request(
        '/api/session',
        options: Options(
          method: 'GET',
        ),
      );

      SpastoonSessionResponseModel session=SpastoonSessionResponseModel.fromJson(response.data);

    var linkResponse=await  gteLink(
        sessionKey: session.sessionKey??'',
        sid: session.sid??'',
        epid: epId

      );


    return linkResponse;

    }catch(e){
      rethrow;
    }

}

Future<GetEpisodeLinkResponseModel> gteLink({
    required String sid,
    required String epid,
    required String sessionKey,

})async{
try{

  var headers = {
    'origin': 'https://sp.ufogrendizer.tv',
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var data = {
    'sid': sid,
    'epid': epid,
    'session_key': sessionKey
  };
  var dio = Dio();
  var response = await dio.request(
    'https://ufocors.fly.dev/https://spacetoongo.com/API/Mob/v4/GoMain/get_episode_link',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );

  return GetEpisodeLinkResponseModel.fromJson(response.data);
}catch(e){
  rethrow;
}
}

}
