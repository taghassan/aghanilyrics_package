import 'package:aghanilyrics/alphacoders/models/CategoriesResponseModel.dart';
import 'package:aghanilyrics/alphacoders/models/FindingResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;
import 'package:logger/logger.dart';
import 'package:html/parser.dart' as parser;

class AlphaCoderWallpaper {
  final Dio client = Dio(BaseOptions(baseUrl: "https://alphacoders.com/"));
  final logger = Logger();

  Future<List<FindingResponseModel>> fetchFinding(
      {String? category, required int page}) async {
    var url = '/$category?page=$page&quickload=1';
    try {
      List<FindingResponseModel> images = [];
      logger.d(url);
      var response = await client.get(url);
      var document = parser.parse(response.data);

      // log(document.getElementsByClassName("sub-title").first.innerHtml);

      var items = document.getElementsByClassName("item");

      for (dom.Element item in items ) {
        try {
          var contentUrl = "${getMeta(item: item, metaKey: 'contentUrl')}";
          var bigPageUrl =
              "${getMeta(item: item, metaKey: 'url') ?? item.getElementsByTagName('a').first.attributes['href']}";
          var keywords = "${getMeta(item: item, metaKey: 'keywords')}";

          var pictureTagAttributes = item
              .getElementsByTagName('picture')
              .first
              .getElementsByTagName('img')
              .first
              .attributes;

          var picture = "${pictureTagAttributes['src']}";
          var title = "${pictureTagAttributes['alt']}";

          images.add(FindingResponseModel(
              fullUrl: contentUrl,
              bigPageUrl: bigPageUrl,
              keywords: keywords,
              src: picture,
              title: title));
        } catch (_) {}
      }
      return images;
    } on DioException catch (e) {
      logger.e(e.message);
      logger.e(e.response?.statusCode);
      rethrow;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  getMeta({required dom.Element item, String? metaKey}) {
    var meta = item
        .getElementsByTagName('meta')
        .where(
          (element) => element.attributes['itemprop'] == metaKey,
        )
        .toList();
    if (meta.isNotEmpty) {
      return meta.first.attributes['content'];
    }
    return null;
  }

 Future<List<CategoriesResponseModel>> getWallCategories() async {
    try {
      List<CategoriesResponseModel> categories=[];
      logger.d("https://alphacoders.com/");
      var response = await Dio(BaseOptions()).get("https://alphacoders.com/");
      var document = parser.parse(response.data);

      var features = document.getElementsByClassName("tag-feature");

      for (var feature in features) {
        var content = feature.getElementsByTagName('h3').first;
        var link = content.getElementsByTagName('a').first;
        var categoryLink=link.attributes['href'];
        var title=link.text;

        var image =link.getElementsByTagName('img').first.attributes['src'];

        categories.add(
            CategoriesResponseModel(
              title: title,
              image: image,
              link: categoryLink
            )
        );

      }

      return categories;
    } catch (e) {

      logger.e(e.toString());
    rethrow;
    }
  }

  getWallpaper() async {
    //https://wall.alphacoders.com/by_collection.php?id=384
    try {
      List<dynamic> images = [];
      for (var i = 1; i <= 500; i++) {
        await Future.delayed(
          const Duration(seconds: 5),
          () async {
            logger.d(
                "https://wall.alphacoders.com/by_collection.php?id=654&quickload=1&page=$i");
            try {
              var response = await Dio(BaseOptions()).get(
                  "https://wall.alphacoders.com/by_collection.php?id=654&quickload=1&page=$i");
              var document = parser.parse(response.data);
              document
                  .getElementsByClassName("thumb-container")
                  .forEach((element) {
                var thumb = [];
                print(
                    " thumb-info = ${element.getElementsByClassName("thumb-info").last.innerHtml.split("&nbsp;").last.trim().startsWith("<a") ? parser.parse(element.getElementsByClassName("thumb-info").last.innerHtml.split("&nbsp;").last.trim()).getElementsByTagName("a").map((e) => e.innerHtml.trim()).toString() : element.getElementsByClassName("thumb-info").last.innerHtml.split("&nbsp;").last.trim()}");

                element.getElementsByTagName("source").forEach((image) {
                  print(
                      " media = ${image.attributes['media']}  \n ${image.attributes['srcset']}");
                  thumb.add("${image.attributes['srcset']}");
                });
                element
                    .getElementsByClassName("img-responsive thumb-desktop")
                    .forEach((image) {
                  print(
                      " image = ${image.attributes['alt']} \n ${image.attributes['width']}*${image.attributes['height']} \n ${image.attributes['src']}");
                  // images.add("${image.attributes['src']}");
                  images.add(
                      {"src": "${image.attributes['src']}", "thumb": thumb});
                });
              });
            } catch (e) {}
          },
        );
      }

      return images;
      // log(document.getElementsByClassName("sub-title").first.innerHtml);
    } catch (e) {}
  }

  getWallpaperMobile() async {
    //https://wall.alphacoders.com/by_collection.php?id=384
    try {
      for (var i = 1; i <= 500; i++) {
        await Future.delayed(
          const Duration(seconds: 5),
          () async {
            try {
              logger.d(
                  "https://mobile.alphacoders.com/by-collection/654?page=$i&quickload=1");
              var response = await Dio(BaseOptions()).get(
                  "https://mobile.alphacoders.com/by-collection/654?page=$i&quickload=1");
              var document = parser.parse(response.data);
              document.getElementsByClassName("item").forEach((element) async {
                logger.d(
                    "https://mobile.alphacoders.com${element.children.first.attributes["href"]}");
                var imgFullSizeResponse = await Dio().get(
                    "https://mobile.alphacoders.com${element.children.first.attributes["href"]}");
                var imgFullSize = parser.parse(imgFullSizeResponse.data);
                imgFullSize
                    .getElementsByClassName("img-full-size")
                    .forEach((imgFullS) {
                  logger.d("${imgFullS.attributes["src"]}");
                });
                // var thumb = [];
                //
                // log("${element.outerHtml}");
                // thumb.add("${element.attributes['src']}");
                //
                // images
                //     .add({"src": "${element.attributes['src']}", "thumb": thumb});
              });
            } catch (e) {}

            // body=GridView.builder(
            //   itemCount: images.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3,
            //       crossAxisSpacing: 4.0,
            //       mainAxisSpacing: 4.0
            //   ),
            //   itemBuilder: (BuildContext context, int index){
            //     return Image.network(images[index],width: Get.width,height: Get.height,fit: BoxFit.fill,);
            //   },
            // );
          },
        );
      }

      // log(document.getElementsByClassName("sub-title").first.innerHtml);
    } catch (e) {}
  }

  getWallpaperArt() async {
    //https://wall.alphacoders.com/by_collection.php?id=384
    try {
      // for (var i = 1; i <= 500; i++) {
      //   await Future.delayed(
      //     const Duration(seconds: 5),
      //     () async {

      try {
        logger.d("https://art.alphacoders.com/arts/by_collection/384");
        var response = await Dio(BaseOptions())
            .get("https://art.alphacoders.com/arts/by_collection/384");
        var document = parser.parse(response.data);
        document
            .getElementsByClassName("thumb-container")
            .forEach((element) async {
          logger.d("${element.children.first.attributes["href"]}");
          logger.d(
              "thumb = ${element.children.first.children.first.children.first.attributes["srcset"]}");
          logger.d("title = ${element.children.first.attributes["title"]}");
          var imgFullSizeResponse =
              await Dio().get("${element.children.first.attributes["href"]}");
          var imgFullSize = parser.parse(imgFullSizeResponse.data);
          imgFullSize
              .getElementsByClassName("img-responsive")
              .forEach((imgFullS) {
            logger.d("imgFullS = ${imgFullS.attributes["src"]}");
          });
          // var thumb = [];
          //
          // log("${element.outerHtml}");
          // thumb.add("${element.attributes['src']}");
          //
          // images
          //     .add({"src": "${element.attributes['src']}", "thumb": thumb});
        });
      } catch (e) {}

      // body=GridView.builder(
      //   itemCount: images.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       crossAxisSpacing: 4.0,
      //       mainAxisSpacing: 4.0
      //   ),
      //   itemBuilder: (BuildContext context, int index){
      //     return Image.network(images[index],width: Get.width,height: Get.height,fit: BoxFit.fill,);
      //   },
      // );

      // },
      // );
      // }

      // log(document.getElementsByClassName("sub-title").first.innerHtml);
    } catch (e) {}
  }

  getWallpaperPictures() async {
    //https://wall.alphacoders.com/by_collection.php?id=384
    try {
      // for (var i = 1; i <= 500; i++) {
      //   await Future.delayed(
      //     const Duration(seconds: 5),
      //     () async {

      try {
        logger.d("https://pics.alphacoders.com/pictures/by_collection/384");
        var response = await Dio(BaseOptions())
            .get("https://pics.alphacoders.com/pictures/by_collection/384");
        var document = parser.parse(response.data);
        document.getElementsByClassName("boxgrid").forEach((element) async {
          print(
              "imgFullS URL = https://pics.alphacoders.com${element.children.first.attributes["href"]}");
          print(
              "thumb = ${element.children.first.children.first.attributes["src"]}");
          print("title = ${element.children.first.attributes["title"]}");
          var imgFullSizeResponse = await Dio().get(
              "https://pics.alphacoders.com${element.children.first.attributes["href"]}");
          var imgFullSize = parser.parse(imgFullSizeResponse.data);
          imgFullSize
              .getElementsByClassName("img-responsive")
              .forEach((imgFullS) {
            print("imgFullS = ${imgFullS.attributes["src"]}");
          });
          // var thumb = [];
          //
          // logger.d("${element.outerHtml}");
          // thumb.add("${element.attributes['src']}");
          //
          // images
          //     .add({"src": "${element.attributes['src']}", "thumb": thumb});
        });
      } catch (e) {}

      // body=GridView.builder(
      //   itemCount: images.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       crossAxisSpacing: 4.0,
      //       mainAxisSpacing: 4.0
      //   ),
      //   itemBuilder: (BuildContext context, int index){
      //     return Image.network(images[index],width: Get.width,height: Get.height,fit: BoxFit.fill,);
      //   },
      // );

      // },
      // );
      // }

      // logger.d(document.getElementsByClassName("sub-title").first.innerHtml);
    } catch (e) {}
  }

  getWallpaperAvatars() async {
    //https://wall.alphacoders.com/by_collection.php?id=384
    try {
      // for (var i = 1; i <= 500; i++) {
      //   await Future.delayed(
      //     const Duration(seconds: 5),
      //     () async {

      try {
        logger.d("https://avatars.alphacoders.com/avatars/by_collection/384");
        var response = await Dio(BaseOptions())
            .get("https://avatars.alphacoders.com/avatars/by_collection/384");
        var document = parser.parse(response.data);
        document
            .getElementsByClassName("avatar-thumb")
            .forEach((element) async {
          logger.d(
              "https://avatars.alphacoders.com${element.children.first.attributes["href"]}");
          logger.d(
              "thumb = ${element.children.first.children.first.attributes["src"]}");
          logger.d("title  = ${element.children.first.attributes["title"]}");
          var imgFullSizeResponse = await Dio().get(
              "https://avatars.alphacoders.com${element.children.first.attributes["href"]}");
          var imgFullSize = parser.parse(imgFullSizeResponse.data);
          imgFullSize
              .getElementsByClassName("img-responsive")
              .forEach((imgFullS) {
            logger.d("imgFullS = ${imgFullS.attributes["src"]}");
          });
          // var thumb = [];
          //
          // logger.d("${element.outerHtml}");
          // thumb.add("${element.attributes['src']}");
          //
          // images
          //     .add({"src": "${element.attributes['src']}", "thumb": thumb});
        });
      } catch (e) {}

      // body=GridView.builder(
      //   itemCount: images.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       crossAxisSpacing: 4.0,
      //       mainAxisSpacing: 4.0
      //   ),
      //   itemBuilder: (BuildContext context, int index){
      //     return Image.network(images[index],width: Get.width,height: Get.height,fit: BoxFit.fill,);
      //   },
      // );

      // },
      // );
      // }

      // logger.d(document.getElementsByClassName("sub-title").first.innerHtml);
    } catch (e) {}
  }

  getWallpaperGifs() async {
    //https://gifs.alphacoders.com/gifs/by_collection/384
    try {
      // for (var i = 1; i <= 500; i++) {
      //   await Future.delayed(
      //     const Duration(seconds: 5),
      //     () async {

      try {
        logger.d("https://gifs.alphacoders.com/gifs/by_collection/384");
        var response = await Dio(BaseOptions())
            .get("https://gifs.alphacoders.com/gifs/by_collection/384");
        var document = parser.parse(response.data);
        document
            .getElementsByClassName("gif-right center")
            .forEach((element) async {
          if (parser
              .parse(element.innerHtml)
              .getElementsByTagName("a")
              .where((element) => element.children.isNotEmpty)
              .isNotEmpty) {
            logger.d(
                "https://gifs.alphacoders.com${parser.parse(element.innerHtml).getElementsByTagName("a").where((element) => element.children.isNotEmpty).first.attributes["href"]}");
            logger.d(
                "thumb = ${parser.parse(element.innerHtml).getElementsByTagName("a").where((element) => element.children.isNotEmpty).first.children.first.attributes["src"]}");
            logger.d(
                "title  = ${element.getElementsByClassName("categorization").first.children.map((e) => "${e.innerHtml} ").toString()}");
            if (parser
                    .parse(element.innerHtml)
                    .getElementsByTagName("a")
                    .where((element) => element.children.isNotEmpty)
                    .first
                    .attributes["href"] !=
                null) {
              var imgFullSizeResponse = await Dio().get(
                  "https://gifs.alphacoders.com${parser.parse(element.innerHtml).getElementsByTagName("a").where((element) => element.children.isNotEmpty).first.attributes["href"]}");
              var imgFullSize = parser.parse(imgFullSizeResponse.data);
              imgFullSize
                  .getElementsByClassName("img-responsive")
                  .forEach((imgFullS) {
                logger.d("imgFullS = ${imgFullS.attributes["src"]}");
              });
            }

            // var thumb = [];
            //
            // logger.d("${element.outerHtml}");
            // thumb.add("${element.attributes['src']}");
            //
            // images
            //     .add({"src": "${element.attributes['src']}", "thumb": thumb});
          }
        });
      } catch (e) {}

      // body=GridView.builder(
      //   itemCount: images.length,
      //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       crossAxisSpacing: 4.0,
      //       mainAxisSpacing: 4.0
      //   ),
      //   itemBuilder: (BuildContext context, int index){
      //     return Image.network(images[index],width: Get.width,height: Get.height,fit: BoxFit.fill,);
      //   },
      // );

      // },
      // );
      // }

      // logger.d(document.getElementsByClassName("sub-title").first.innerHtml);
    } catch (e) {}
  }
}
