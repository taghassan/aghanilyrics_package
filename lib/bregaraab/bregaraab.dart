import 'package:aghanilyrics/bregaraab/download.dart';
import 'package:aghanilyrics/bregaraab/models/CategoriesModel.dart';
import 'package:aghanilyrics/bregaraab/models/SongsModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
import 'package:html/parser.dart' as parser;

class BregAraabSongs {
  final Dio client = Dio(BaseOptions(baseUrl: "https://www.bregaraab.com"));

  final logger = Logger();

  final player = AudioPlayer();

  Future<List<CategoriesModel>> getCategories() async {
    var response = await client.get('/');

    var document = parser.parse(response.data);
    List<CategoriesModel> categories = [];
    for (var value
        in document.getElementsByClassName("categoriesList").first.children) {
      categories.add(CategoriesModel(
          url: value.children.first.attributes["href"].toString(),
          name: value.children.first.innerHtml));
      logger.i("Category = ${value.children.first.innerHtml}");
      logger.i(
          "Category href = ${value.children.first.attributes["href"].toString()}");
    }

    return categories;
  }

  Future<List<SongsModel>> getSongs({required String url}) async {
    try {
      List<SongsModel> songsList = [];

      var response = await client.get(url);

      var document = parser.parse(response.data);

      document
          .getElementsByClassName("country-singers")
          .forEach((element) async {
        var links = parser.parse(element.innerHtml).getElementsByTagName("a");
        // log(links.first.innerHtml);
        // log("${links.first.attributes['href']}");

        SongsModel model = SongsModel(
            singerName: links.first.innerHtml,
            url: "${links.first.attributes['href']}",
            songs: []);
        songsList.add(model);
      });

      return songsList;
    } catch (e) {
      logger.e("$e");
      rethrow;
    }
  }


  getChildList(SongsModel songsList) async {
    List<Songs> songsListDetails = [];
    try {




        var singlePageResponse = await client.get("${songsList.url}");

        var singlePageResponseHtml = parser.parse(singlePageResponse.data);
        singlePageResponseHtml
            .getElementsByClassName("col-md-4 col-xs-12 pull-right")
            .forEach((songItem) async {
          // log("${songItem.children[1].innerHtml}");
          // log("${songItem.children[1].attributes['href']}");
          var singleSongPageResponse =
          await client.get("${songItem.children[1].attributes['href']}");
          var singleSongPageResponseHtml = parser.parse(singleSongPageResponse.data);
          if (singleSongPageResponseHtml
              .getElementsByTagName("audio")
              .isNotEmpty) {
            logger.i("${singleSongPageResponseHtml.getElementsByTagName("audio").first.attributes["src"]}");
            songsListDetails.add(Songs(
                songName: songItem.children[1].innerHtml,
                url:
                "${singleSongPageResponseHtml.getElementsByTagName("audio").first.attributes["src"]}"));



          }
        });



    } catch (e) {
      logger.e(e.toString());
      return null;
    }
    return songsListDetails;
  }

  play(Songs? song) async {

    BADownloadManager manager=BADownloadManager();

    manager.downloadValue = 0.0;

    await manager.download(
        Songs(songName: song?.songName ?? '', url: "${song?.url}"), 0);

    if (kDebugMode) {
      print("${song?.url}");
    }
    String savePath = await manager.getDownloadPath("${song?.songName}");
    savePath = "$savePath/${song?.songName}.mp3";
    if (kDebugMode) {
      print(savePath);
    }
    // player.setUrl(savePath);
    try {
      player.setUrl(savePath);
      // await player.setUrl(song?.url??'');
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      // Linux/Windows: maps to PlayerErrorCode.index
      print("Error code: ${e.code}");
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web/Linux: a generic message
      // Windows: MediaPlayerError.message
      print("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      print("Connection aborted: ${e.message}");
    } catch (e) {
      // Fallback for all other errors
      print('An error occured: $e');
    }

    player.play();
  }


}
