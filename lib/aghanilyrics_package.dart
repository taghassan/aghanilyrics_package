library aghanilyrics;

import 'package:aghanilyrics/SingerResponseModel.dart';
import 'package:aghanilyrics/SongResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parser;
import 'package:logger/logger.dart';

class FetchSongs {

  final Dio client = Dio(BaseOptions(baseUrl: "https://aghanilyrics.com"));

  final logger = Logger();

  Future<List<SingerResponseModel>> fetchNewSingers()async{
    try {
      var response = await client.get('/kalimat-aghani.php');

      if (response.statusCode == 200) {

        return extractSingerFromResponse(response);
      } else {

        logger.d('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      logger.d('Error: $e');
      return [];
    }
  }



  Future<List<SingerResponseModel>> fetchSingers({
    String en = 'Sudan',
    String ar = 'كلمات-اغاني-سودانية',

  }) async {
    try {
      Response response = await client.get('/song-lyrics.php?en=$en&ar=$ar');


      if (response.statusCode == 200) {

        return extractSingerFromResponse(response);
      } else {

        logger.d('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      logger.d('Error: $e');
      return [];
    }
  }

  Future<List<SingerResponseModel>> extractSingerFromResponse(Response response)async{
    final document = parser.parse(response.data);
    final tableRows = document.getElementsByTagName('tr');

    List<SingerResponseModel> extractedSongList = [];

    for (var row in tableRows) {
      final columns = row.getElementsByTagName('td');

      if (columns.length == 3) {
        String singerName = columns[0].text.trim();
        String? lyricsUrl = columns[0].firstChild?.attributes['href'];

        String count = columns[1].text.trim();
        String country = columns[2].text.trim();


        logger.i(
            "singerName  $lyricsUrl count $count country $country $singerName lyricsUrl");

        extractedSongList.add(SingerResponseModel(
            singerName: singerName,
            country: country,
            songs: count,
            url: lyricsUrl));
      }
    }

    return extractedSongList;
  }


  Future<List<SongResponseModel>>  fetchByCategory({
    String en = 'Sudan',
    String ar = 'كلمات-اغاني-سودانية',
    String? songs
  })async{

    try {
      var response = await client.get('/singer.php?en=$en&ar=$ar&songs=$songs');


      if (response.statusCode == 200) {
        final document = parser.parse(response.data);

        final tableRows = document.getElementsByTagName('tr');

        List<SongResponseModel> extractedSongList = [];

        for (var row in tableRows) {
          final columns = row.getElementsByTagName('td');

          if (columns.length == 3) {
            String songName = columns[0].text.trim();
            String? lyricsUrl = columns[0].firstChild?.attributes['href'];

            String lyrics = columns[1].text.trim();
            String composer = columns[2].text.trim();


            logger.i(
                "singerName  $lyricsUrl count $lyrics country $composer $songName lyricsUrl");

            extractedSongList.add(SongResponseModel(
                songName: songName,
                lyricsUrl: lyricsUrl,
                composer: composer,
                lyrics: lyrics
            ),);
          }
        }

        return extractedSongList;
      }else{

        logger.d('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      logger.d('Error: $e');
      return [];
    }
  }


  ///
///

  Future<List<SongResponseModel>> fetchSongData({required String? url}) async {

    url ??= 'https://aghanilyrics.com/allsongslyrics.php?songslyrics=osman-hussein&ar=%D9%83%D9%84%D9%85%D8%A7%D8%AA-%D8%A7%D8%BA%D8%A7%D9%86%D9%8A-%D8%B9%D8%AB%D9%85%D8%A7%D9%86-%D8%AD%D8%B3%D9%8A%D9%86';

    try {

      final response = await client.get(url);
      if (response.statusCode == 200) {
        final document = parser.parse(response.data);
        final tableRows = document.getElementsByTagName('tr');

        List<SongResponseModel> extractedSongs = [];

        for (var row in tableRows) {
          final columns = row.getElementsByTagName('td');

          if (columns.length == 3) {
            String songName = columns[0].text.trim();
            String? lyricsUrl = columns[0].firstChild?.attributes['href'];

            String lyrics = columns[1].text.trim();
            String composer = columns[2].text.trim();
            List<String>? fullLyrics = [];


            // findYoutubeVideo(songName:songName);

            extractedSongs.add(
                SongResponseModel(
                  songName: songName,
                  composer: composer,
                  lyrics: lyrics,
                    lyricsUrl:lyricsUrl
                ),
                );
          }
          // setState(() {
          //   songs = extractedSongs;
          //   songsLoading = false;
          // });
        }

        return extractedSongs;
      } else {

          logger.d('Failed to load data: ${response.statusCode}');
          return [];
      }
    } catch (e) {

        logger.d('Error: $e');
        return [];
    }
  }


  ///
///
///

  Future<List<String>> fetchLyrics(String lyricsUrl) async {

    try {
      final response = await client.get(lyricsUrl);
      if (response.statusCode == 200) {
        final document = parser.parse(response.data);

        final lyricsDiv = document.getElementById('mytext');
        if (lyricsDiv != null) {
          // Extract all <p> tags within the lyrics div
          final paragraphs = lyricsDiv.getElementsByTagName('p');
          // Combine all paragraphs into a single string, separated by newlines

          return [
            '',
            ...paragraphs.map(
                  (e) => e.text,
            ),
            ''
          ];
          // return paragraphs.map((p) => p.text.trim()).join('\n');
        } else {
          logger.e('Lyrics not found');
          return [];
        }
      } else {
        logger.e('Failed to fetch lyrics: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      logger.e('Error fetching lyrics: $e');
      return [];
    }
  }


}
