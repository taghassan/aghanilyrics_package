import 'dart:convert';

import 'package:aghanilyrics/logger_helper.dart';
import 'package:aghanilyrics/sm3na/models/ArtistListResponseModel.dart';
import 'package:aghanilyrics/sm3na/models/SingerPageReponseModel.dart';
import 'package:aghanilyrics/sm3na/models/Sm3naSongsResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class Sm3naHelper with LoggerHelper {
  Dio client=Dio(
    BaseOptions(
      baseUrl: "https://www.sm3na.com"
    )
  );


  Future<Sm3naSongsResponseModel> loadMore({required String url,String? start,String?filter}) async {
    try {
      var headers = {
        'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'cookie':
        'PHPSESSID=r5h3frq4it2m1ph1noeq9li2qo; lang=arabic; _gcl_au=1.1.1195947117.1730698800; cf_clearance=atzUlsb_HP45cjqZvGNFFHaGN023y6FRzrZjuhEjO6Q-1730698800-1.2.1.1-vU._bj9EGu7dSZAGZQe6mB.3akbqWctjwPho23.JgCOo7Rp1CuO4htZSL3NH8nGIkjCPOBjbOld1DMIT8Zmhfmd6ZDonmWsQRvSM7ZEh7fBad6Sj74Nd8_ldWQHp896jrqu9Xa1m6BF09K1M48PqLtjJPOYNvIAlOWYh8.HI7m08JjluI3hG4Gq0An2oXmeTonDk0w5r1QIL5G3B21i24TNLvnYAvDb6hencGXt3S900xgyNEHmRXO7rQLsVcuVhU9tAEYcH_J0Li1ce55W49ayfZw6EJ8eHvrQ_ez8bI_NL5rOfpH9rZVFMXRWgfmgBY5mpl6D4wQFr1K9ozJGQjrI41kfB.uphDnkgLWd8iEvSzlZLG1pQTFOrhOoBIebNZn_vdG3jgXPUuZ2BBD16Zg; PHPSESSID=qrq7ke8voqovkoirclgterenlg; lang=arabic',
        // 'origin': 'https://www.sm3na.com',
        // 'referer': 'https://www.sm3na.com/audios/18cc9daa29'
      };
      var data =
      '''start=${start??'29444'}&filter=${filter??'832'}&token_id=58d0c791932bba966d3d158f8337a7b7''';
      var dio = Dio();
      var response = await dio.request(
        'https://www.sm3na.com/requests/load_explore.php',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
var noMoreDataError='لا توجد نتائج متوفره. برجاء البحث بصيغه اخرى.';
      if (response.data != null && response.data.toString().isNotEmpty) {
        var mainContainers = parser.parse(response.data);
        if (mainContainers.querySelector('.message-inner')?.text.trim() ==
            noMoreDataError) {
          logger.e(mainContainers.querySelector('.message-inner')?.text.trim());
          throw "noMoreData";
        } else {
        return  extractSongs(mainContainers.body);
        }
      } else {
        logger.e("No content");
        throw "noMoreData";
      }
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<Sm3naSongsResponseModel> fetchSingerPage({required String url}) async {
    var sm3na = await client.get(url);

    var document = parser.parse(sm3na.data);

    var mainContainers = document.querySelector('#main-content');

   return extractSongs(mainContainers);
  }

  Sm3naSongsResponseModel extractSongs(dom.Element? mainContainers) {
    Map<String,dynamic>? response={
      "start":"-1",
      "filter":"-1",
      "songs":[]
    };
    List<Map<String,dynamic>> songs=[];
    try {

      var author = mainContainers?.querySelector('#load-more div a');

      if(author!=null)
      {
        var exploreTracks = author.attributes['onclick'];
        RegExp regExp = RegExp(r'\d+');
        Iterable<Match> matches = regExp.allMatches(exploreTracks.toString());
        List<int> numbers =
        matches.map((match) => int.parse(match.group(0)!)).toList();
        var start = numbers.first;
        var filter = numbers.last;

        response['start']='$start';
        response['filter']='$filter';

        // logger.w(
        //     "exploreTracks ${author.attributes['onclick']} start= $start filter= $filter");
      }else{
        // logger.e("no exploreTracks Info ");
      }

    } catch (e) {
      logger.e(e.toString());
    }



    //***************** created by TajEldeen *****************//
    //
    //********************************************************//
    try{

      var songContainers = mainContainers?.querySelectorAll('.song-container');

      for (dom.Element? songContainer in songContainers ?? []) {
        // logger.w("index = $index");

        var songTitle = songContainer
            ?.querySelector('.song-top .song-titles .song-title a div')
            ?.attributes['title'];
        var songSinger = songContainer
            ?.querySelector('.song-top .song-titles .song-author a')
            ?.text.trim();

        // logger.i("songAuthor $songAuthor");

        var src =
        songContainer?.querySelector('.song-art a img')?.attributes['src'];
        var imageAlt =
        songContainer?.querySelector('.song-art a img')?.attributes['alt'];

        var songTop = songContainer?.querySelector('.song-top div')?.attributes;

        // logger.i("song-Title $songTitle");
        // logger.i("song-container  $src $imageAlt");
        // logger.i(
        //     "song-songTop  ${songTop?['data-track-name']}  ${songTop?['data-track-id']} ${songTop?['id']} ${songTop?['data-track-url']} ${songTop?['data-track-format']}");
        songs.add({
          "song_title":songTitle,
          "image":{
            "src":"$src",
            "alt":"$imageAlt"
          },
          "track":{
            "id":"${songTop?['id']}",
            "track_id":"${songTop?['data-track-id']}",
            "name":"${songTop?['data-track-name']}",
            "url":"${songTop?['data-track-url']}",
            "format":"${songTop?['data-track-format']}",
            "song_singer":songSinger
          }
        });
      }
      response['songs']=songs;

      // logDeveloper("${jsonEncode(response)}");

      return Sm3naSongsResponseModel.fromJson(response);
    }catch(e){
      logger.e(e.toString());
      rethrow;
    }
  }

 Future<List<SingerPageReponseModel>> fetchCategorySingers({required String url}) async {

    try{

      var sm3na = await client.get(url);

      var document = parser.parse(sm3na.data);
      // List to hold each section's extracted data
      List<Map<String, dynamic>> sections = [];
      List<dom.Element> headers = document.querySelectorAll('.artists-container');
      for (dom.Element headerElement in headers) {
        List<Map<String, dynamic>> linksData = [];
        // Extract header text
        // String header = headerElement.text.trim();
        dom.Element? header = headerElement.querySelector('table');

        var title = "${header?.querySelector('tr')?.text.trim()}";
        List<dom.Element>? links = header?.querySelectorAll('tr td div div a');
        // logger.i("Extract header text $title");
        for (dom.Element link in links ?? []) {
          linksData.add({
            "title": "${link.attributes['title']}",
            "href": "${link.attributes['href']}"
          });
          // logger
          //     .i("Extract header text  ${link.text.trim()} ${link.attributes}  ");
        }

        sections.add({"section_title": title, "links": linksData});
      }

      logDeveloper(jsonEncode(sections));
      return sections.map((e) => SingerPageReponseModel.fromJson(e),).toList();

    }catch(e){
      rethrow;
    }

  }

 Future<List<ArtistListResponseModel>>  fetchArtistsList() async {
    var sm3na = await client.get("/artists");

    var document = parser.parse(sm3na.data);

    // List to hold each section's extracted data
    List<Map<String, dynamic>> sections = [];

    List<dom.Element> headers = document.querySelectorAll('.page-header');

    for (dom.Element headerElement in headers) {
      // Extract header text
      String header = headerElement.text.trim();

      // Locate the links associated with this header (assumed to be close to each header element)
      List<Map<String, dynamic>> links = [];
      dom.Element? sibling = headerElement.nextElementSibling;

      if (sibling != null) {
        sibling.querySelectorAll('.heading_bg a').forEach((element) {
          final title = element.attributes['title'] ?? '';
          final url = element.attributes['href'] ?? '';
          final isCategoryUrl = (element.attributes['href'] ?? '').contains('/cat');
          final isAudiosUrl = (element.attributes['href'] ?? '').contains('/audios');
          if (title.isNotEmpty && url.isNotEmpty) {
            links.add({'title': title, 'url': url,'is_category_url':isCategoryUrl,'is_audios_url':isAudiosUrl});
          }
        });
      }

      // Add this section's data to the sections list
      sections.add({
        "header": header,
        "links": links,
      });
    }
    // logDeveloper("sections ${jsonEncode(sections)}");
    return sections.map((section) =>  ArtistListResponseModel.fromJson(section),).toList();

  }

  fetchHomeCategories() async {
    try {
      var sm3na = await client.get("https://sm3na.com/");

      var document = parser.parse(sm3na.data);
      List<Map<String, dynamic>> links = [];
      var sectionTitle = document
          .querySelector('.welcome-cats .row-body .welcome-box-section')
          ?.text
          .trim();
      Map<String, dynamic> section = {
        "section_title": sectionTitle,
        "links": []
      };
      // logger.i(
      //     "section ${document.querySelector('.welcome-cats .row-body .welcome-box-section')?.text}"); //
      for (dom.Element link in document
          .querySelectorAll('.welcome-cats .row-body .welcome-categories a')) {
        // logger.i("text ${link.text}"); //
        // logger.i("href ${link.attributes['href']}"); //

        var linkHref = link.attributes['href'];
        var linkText = link.text.trim();

        links.add({
          'title': linkText,
          'url': linkHref,
        });
      }
      section['links'] = links;

      logDeveloper("${jsonEncode(section)}");
    } catch (e) {
      logger.e(e.toString());
    }
  }

}