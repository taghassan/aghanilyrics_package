import 'dart:async';

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

  StreamController fetchSongsStream = StreamController();

  Future<List<CategoriesModel>> fetchCategories() async {
    var response = await client.get('/');

    var document = parser.parse(response.data);
    List<CategoriesModel> categories = [];
    for (var value
        in document.getElementsByClassName("categoriesList").first.children) {
      categories.add(CategoriesModel(
          url: value.children.first.attributes["href"].toString(),
          name: value.children.first.innerHtml));

      logger.i(
          "Category = ${value.children.first.innerHtml}\nCategory href = ${value.children.first.attributes["href"].toString()}");
    }

    return categories;
  }

  Future<List<SongsModel>> fetchSongs({required String url}) async {
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

  Future<List<Songs>> fetchChildList(SongsModel songsList) async {
    List<Songs> songsListDetails = [];
    try {
      var singlePageResponse = await client.get("${songsList.url}");

      var singlePageResponseHtml = parser.parse(singlePageResponse.data);

      var songItems = singlePageResponseHtml
          .getElementsByClassName("col-md-4 col-xs-12 pull-right");

      //**
      songsListDetails = songItems
          .map(
            (songItem) => Songs(
                songName: songItem.children[1].innerHtml,
                url: "${songItem.children[1].attributes['href']}"),
          )
          .toList();
      //**

      /*
      for (var songItem in songItems) {
        // log("${songItem.children[1].innerHtml}");
        // log("${songItem.children[1].attributes['href']}");

        var link = "${songItem.children[1].attributes['href']}";
        bool validURL = Uri.parse(link).isAbsolute;

        if (validURL) {
          var singleSongPageResponse = await client.get(link);
          var singleSongPageResponseHtml =
              parser.parse(singleSongPageResponse.data);
          if (singleSongPageResponseHtml
              .getElementsByTagName("audio")
              .isNotEmpty) {
            logger.i(
                "${singleSongPageResponseHtml.getElementsByTagName("audio").first.attributes["src"]}");
            songsListDetails.add(Songs(
                songName: songItem.children[1].innerHtml,
                url:
                    "${singleSongPageResponseHtml.getElementsByTagName("audio").first.attributes["src"]}"));
          }

          fetchSongsStream.add({"total": songItems.length, "received": songsListDetails.length});
        }
      }
       */

      logger.d("songsListDetails $songsListDetails");
      return songsListDetails;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<String?> getSongUrl({String? songItemUrl}) async {
    // log("${songItem.children[1].innerHtml}");
    // log("${songItem.children[1].attributes['href']}");

    if (songItemUrl == null || !Uri.parse(songItemUrl).isAbsolute) return null;

    var singleSongPageResponse = await client.get(songItemUrl);
    var singleSongPageResponseHtml = parser.parse(singleSongPageResponse.data);
    if (singleSongPageResponseHtml.getElementsByTagName("audio").isNotEmpty) {
      logger.i(
          "${singleSongPageResponseHtml.getElementsByTagName("audio").first.attributes["src"]}");

      return "${singleSongPageResponseHtml.getElementsByTagName("audio").first.attributes["src"]}";
    }

    return null;
  }

  playOnline(Songs? song) async {
    // player.setUrl(savePath);
    if (song == null) return;
    String? url = await getSongUrl(songItemUrl: song.url);
    if (url == null) return;

    setUrlAndPlay(url: url);
  }

  play(Songs? song) async {
    if (song == null) return;
    String? url = await getSongUrl(songItemUrl: song.url);
    if (url == null) return;

    BADownloadManager manager = BADownloadManager();

    manager.downloadValue = 0.0;

    await manager.download(Songs(songName: song.songName ?? '', url: url), 0);

    if (kDebugMode) {
      print(url);
    }
    String savePath = await manager.getDownloadPath("${song.songName}");
    savePath = "$savePath/${song.songName}.mp3";
    if (kDebugMode) {
      print(savePath);
    }

    setUrlAndPlay(url: savePath);
  }

  setUrlAndPlay({required String url}){
    try {
      player.setUrl(url);
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
