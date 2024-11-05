import 'dart:convert';

import 'package:aghanilyrics/logger_helper.dart';
import 'package:aghanilyrics/sm3na/models/ArtistListResponseModel.dart';
import 'package:aghanilyrics/sm3na/models/SearchResultResponseModel.dart';
import 'package:aghanilyrics/sm3na/models/SingerPageReponseModel.dart';
import 'package:aghanilyrics/sm3na/models/Sm3naSongsResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class Sm3naHelper with LoggerHelper {
  Dio client = Dio(BaseOptions(baseUrl: "https://www.sm3na.com"));

  String? tokenId = '';

  getToken(Response sm3na) {
    try {
      String? tokenId;
      logger.i("${sm3na.headers}");

      final html = sm3na.data.toString();

      // Use a regular expression to find the token_id
      final tokenIdRegex = RegExp(r'token_id\s*=\s*"([^"]+)"');
      final match = tokenIdRegex.firstMatch(html);

      if (match != null) {
        tokenId = match.group(1);
        logger.i('Token ID: $tokenId');
      } else {
        logger.e('Token ID not found.');
      }
      return tokenId;
    } catch (e) {
      return null;
    }
  }

  Future<List<SearchResultResponseModel>> search({String? query,String? url,String? start,String? live}) async {

    var sm3na = await Dio().get('https://www.sm3na.com');
    logger.i("sm3na ${sm3na.headers['set-cookie']?[0]}");
    var token = getToken(sm3na);
    var headers = {
      'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
      'cookie': '${sm3na.headers['set-cookie']?[0]}',
      'origin': 'https://www.sm3na.com',
      'referer': url??'https://www.sm3na.com/audios/18cc9daa29'
    };

    var data = '''q=$query &start=${start??'1'}&live=${live??'1'}&token_id=$token''';
    var dio = Dio();
    var response = await dio.request(
      'https://www.sm3na.com/requests/load_people.php',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    List<Map<String,dynamic>>  searchResultsList=[];
    if (response.statusCode == 200) {
      var document=  parser.parse(response.data);

      var searchResults=document.querySelectorAll('.track-inner');


      for(dom.Element result in searchResults)
      {
        var link=result.parent?.attributes['href'];
        var image=result.querySelector('.search-image img')?.attributes['src'];
        var linkText=result.querySelector('.search-text')?.text.trim();
        var isManyAudios="${result.parent?.attributes['href']}".contains('audios');

        searchResultsList.add({
          "linkText":linkText,
          "link":link,
          "image":image,
          "isManyAudios":isManyAudios
        });
        logger.i("document a ${result.parent?.attributes['href']}");
        logger.i("document img ${result.querySelector('.search-image img')?.attributes['src']}");
        logger.i("document text ${result.querySelector('.search-text')?.text.trim()}");

      }

    }
    else {
      print(response.statusMessage);
    }

    return searchResultsList.map((e) => SearchResultResponseModel.fromJson(e),).toList();
  }


  Future<Sm3naSongsResponseModel> loadMore(
      {required String url, String? start, String? filter}) async {
    try {
      var sm3na=await Dio().get('https://www.sm3na.com');
      logger.i("sm3na ${sm3na.headers['set-cookie']?[0]}");
      tokenId=getToken(sm3na);
      var cookie='${sm3na.headers['set-cookie']?[0]}';

      logger.i("tokenId $tokenId");
      var headers = {
        'accept': '*/*',
        'accept-language':
            'ar-SD,ar;q=0.9,en-GB;q=0.8,en;q=0.7,en-US;q=0.6,zh-CN;q=0.5,zh;q=0.4',
        'content-type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'cookie': cookie,
        'origin': 'https://www.sm3na.com',
        'priority': 'u=1, i',
        'referer': url,
        'sec-ch-ua':
            '"Chromium";v="130", "Google Chrome";v="130", "Not?A_Brand";v="99"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"macOS"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-origin',
        'user-agent':
            'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36',
        'x-requested-with': 'XMLHttpRequest'
      };
      var data =
          '''start=${start ?? '29444'}&filter=${filter ?? '832'}&token_id=$tokenId''';
      var dio = Dio();
      var response = await dio.request(
        'https://www.sm3na.com/requests/load_explore.php',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      var noMoreDataError = 'لا توجد نتائج متوفره. برجاء البحث بصيغه اخرى.';
      // logger.i("Load More data ${response.data}");
      if (response.data != null && response.data.toString().isNotEmpty) {
        var mainContainers = parser.parse(response.data);
        if (mainContainers.querySelector('.message-inner')?.text.trim() ==
            noMoreDataError) {
          // logger.e(mainContainers.querySelector('.message-inner')?.text.trim());
          throw "noMoreData";
        } else {
          return extractSongs(mainContainers.body);
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

    getToken(sm3na);

    var document = parser.parse(sm3na.data);

    var mainContainers = document.querySelector('#main-content');

    return extractSongs(mainContainers);
  }

  // getToken(Response sm3na) {
  //   try {
  //     logger.i("${sm3na.headers}");
  //
  //     final html = sm3na.data.toString();
  //
  //     // Use a regular expression to find the token_id
  //     final tokenIdRegex = RegExp(r'token_id\s*=\s*"([^"]+)"');
  //     final match = tokenIdRegex.firstMatch(html);
  //
  //     if (match != null) {
  //       tokenId = match.group(1);
  //       logger.i('Token ID: $tokenId');
  //     } else {
  //       logger.e('Token ID not found.');
  //     }
  //   } catch (e) {}
  // }

  Sm3naSongsResponseModel extractSongs(dom.Element? mainContainers) {
    Map<String, dynamic>? response = {
      "start": "-1",
      "filter": "-1",
      "songs": []
    };
    List<Map<String, dynamic>> songs = [];
    try {
      var author = mainContainers?.querySelector('#load-more div a');

      if (author != null) {
        var exploreTracks = author.attributes['onclick'];
        RegExp regExp = RegExp(r'\d+');
        Iterable<Match> matches = regExp.allMatches(exploreTracks.toString());
        List<int> numbers =
            matches.map((match) => int.parse(match.group(0)!)).toList();
        var start = numbers.first;
        var filter = numbers.last;

        response['start'] = '$start';
        response['filter'] = '$filter';

        // logger.w(
        //     "exploreTracks ${author.attributes['onclick']} start= $start filter= $filter");
      } else {
        // logger.e("no exploreTracks Info ");
      }
    } catch (e) {
      logger.e(e.toString());
    }

    //***************** created by TajEldeen *****************//
    //
    //********************************************************//
    try {
      var songContainers = mainContainers?.querySelectorAll('.song-container');

      for (dom.Element? songContainer in songContainers ?? []) {
        // logger.w("index = $index");

        var songTitle = songContainer
            ?.querySelector('.song-top .song-titles .song-title a div')
            ?.attributes['title'];
        var songSinger = songContainer
            ?.querySelector('.song-top .song-titles .song-author a')
            ?.text
            .trim();

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
          "song_title": songTitle,
          "image": {"src": "$src", "alt": "$imageAlt"},
          "track": {
            "id": "${songTop?['id']}",
            "track_id": "${songTop?['data-track-id']}",
            "name": "${songTop?['data-track-name']}",
            "url": "${songTop?['data-track-url']}",
            "format": "${songTop?['data-track-format']}",
            "song_singer": songSinger
          }
        });
      }
      response['songs'] = songs;

      // logDeveloper("${jsonEncode(response)}");

      return Sm3naSongsResponseModel.fromJson(response);
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<List<SingerPageReponseModel>> fetchCategorySingers(
      {required String url}) async {
    try {
      var sm3na = await client.get(url);
      getToken(sm3na);
      var document = parser.parse(sm3na.data);
      // List to hold each section's extracted data
      List<Map<String, dynamic>> sections = [];
      List<dom.Element> headers =
          document.querySelectorAll('.artists-container');
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
      return sections
          .map(
            (e) => SingerPageReponseModel.fromJson(e),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ArtistListResponseModel>> fetchArtistsList() async {
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
          final isCategoryUrl =
              (element.attributes['href'] ?? '').contains('/cat');
          final isAudiosUrl =
              (element.attributes['href'] ?? '').contains('/audios');
          if (title.isNotEmpty && url.isNotEmpty) {
            links.add({
              'title': title,
              'url': url,
              'is_category_url': isCategoryUrl,
              'is_audios_url': isAudiosUrl
            });
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
    return sections
        .map(
          (section) => ArtistListResponseModel.fromJson(section),
        )
        .toList();
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
