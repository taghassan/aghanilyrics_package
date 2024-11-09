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
          .map<TvShowsResponseModel>((e) => TvShowsResponseModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  //
  Future<List<SpacetoonEpisodesResponseModel>> fetchSpacetoonRecentEpisodes() async {
    try {
      var response = await client.get(
        '/api/recentEpisodes',
      );
      return (response.data ?? [])
          .map<SpacetoonEpisodesResponseModel>(
              (e) => SpacetoonEpisodesResponseModel.fromJson(e))
          .toList();
    } catch (e) {
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

   getEpisodeLink()async{

    try{

      var response = await client.request(
        '/api/session',
        options: Options(
          method: 'GET',
        ),
      );

      SpastoonSessionResponseModel session=SpastoonSessionResponseModel.fromJson(response.data);



    }catch(e){
      rethrow;
    }

}

gteLink({
    required String sid,
    required String epid,
    required String sessionKey,

})async{

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

  if (response.statusCode == 200) {
    // print(json.encode(response.data));
  }
  else {
    print(response.statusMessage);
  }

}

}
