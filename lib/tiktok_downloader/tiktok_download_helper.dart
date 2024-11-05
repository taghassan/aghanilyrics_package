import 'dart:io';

import 'package:aghanilyrics/dio_logger.dart';
import 'package:aghanilyrics/tiktok_downloader/helpers/dir_helper.dart';
import 'package:aghanilyrics/tiktok_downloader/models/AnalysisResponseModel.dart';
import 'package:aghanilyrics/tiktok_downloader/models/download_item.dart';
import 'package:aghanilyrics/tiktok_downloader/models/save_video_params.dart';
import 'package:aghanilyrics/tiktok_downloader/models/tiktok_video_model.dart';
import 'package:aghanilyrics/tiktok_downloader/models/video_item.dart';
import 'package:aghanilyrics/tiktok_downloader/utils/app_enums.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

// import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:saver_gallery/saver_gallery.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

class TiktokDownloadHelper {
  List<DownloadItem> newDownloads = [];
  List<VideoItem> oldDownloads = [];
  final Dio client = Dio(
    BaseOptions(
        baseUrl: "https://tiktok-download-without-watermark.p.rapidapi.com",
        headers: {
          'X-RapidAPI-Key':
              '1e2d328129msha49fca00df6f881p147af8jsne121c53deae6',
          'X-RapidAPI-Host': 'tiktok-download-without-watermark.p.rapidapi.com'
        }),
  );

  final logger = Logger();

  Future<TiktokVideoModel> analysis({required String videoLink}) async {
    addPrettyDioLogger(client);
    try {
      var response =
          await client.get("/analysis", queryParameters: {"url": videoLink});

      return TiktokVideoModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AnalysisResponseModel> fetchAnalysis(
      {required String videoLink}) async {
    addPrettyDioLogger(client);
    try {
      var response =
          await client.get("/analysis", queryParameters: {"url": videoLink});

      return AnalysisResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AnalysisResponseModel> fetchAnalysisAjax(
      {required String videoLink}) async {
    addPrettyDioLogger(client);
    try {
      var headers = {
        'content-type': 'application/x-www-form-urlencoded',
        'cookie':
            '_ga=GA1.1.558764525.1730653929; fpestid=IYtdZdm6qssSXgaY7yKp9kDlL7FFPDqTF1IKhhllWzZat4UcTycOw-HIyzOcqyVLUs5DdA; trp_language=ar; _cc_id=642a29609ee6854aef121170e8b8cee; panoramaId_expiry=1731258731899; panoramaId=b6d6c24f9689a4d85cca3f6286b616d53938a8392e9a058e26a4ff223dc088b5; panoramaIdType=panoIndiv; _ga_DWYR5ZNKYQ=GS1.1.1730658871.2.1.1730658874.57.0.0',
        'hx-current-url': 'https://tiktokio.com/ar/',
        'hx-request': 'true',
        'hx-target': 'tiktok-parse-result',
        'hx-trigger': 'search-btn',
        'origin': 'https://tiktokio.com',
        'priority': 'u=1, i',
        'referer': 'https://tiktokio.com/ar/',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': '"macOS"',
        'sec-fetch-dest': 'empty',
        'sec-fetch-mode': 'cors',
        'sec-fetch-site': 'same-origin'
      };
      var data = {'prefix': 'dtGslxrcdcG9raW8uY29t', 'vid': videoLink};
      var dio = Dio();
      var response = await dio.request(
        'https://tiktokio.com/api/v1/tk-htmx',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      List<Link> links = [];
      String? title = '';
      try {
        links = extractLinks(response.data);
      } catch (e) {}

      try {
        title = extractTitle(response.data);
      } catch (e) {}

      // print(json.encode(response.data));
      return AnalysisResponseModel(
          code: 0,
          msg: "success",
          processedTime: 0.8582,
          data: TiktokVideoData(
            id: '${DateTime.now().microsecondsSinceEpoch}',
            title: title ?? '',
            play: links.first.url,
            cover: links.first.imageUrl,
            originCover: links.first.imageUrl,
            links: links,
            playCount: 0,
            downloadCount: 0,
            duration: 0,
          ));
    } catch (e) {
      rethrow;
    }
  }

  Future<List<VideoItem>> loadOldDownloads() async {
    oldDownloads.clear();
    final path = await DirHelper.getAppPath();
    final directory = Directory(path);
    final files = await directory.list().toList();
    final newDownloadedVideosPaths = newDownloads.map((e) => e.path);
    for (final file in files) {
      if (file is File && file.path.endsWith('.mp4')) {
        final videoPath = file.path;
        if (newDownloadedVideosPaths.contains(videoPath)) continue;
        final thumbnailPath = "";
        // final thumbnailPath = await VideoThumbnail.thumbnailFile(
        //   video: videoPath,
        //   thumbnailPath: (await getTemporaryDirectory()).path,
        //   imageFormat: ImageFormat.PNG,
        //   quality: 30,
        // );
        oldDownloads
            .add(VideoItem(path: videoPath)..thumbnailPath = thumbnailPath);
      }
    }
    return oldDownloads;
  }

  Future<String> saveVideoLink(
      {required AnalysisResponseModel tikTokVideo,
      required Link linkModel,
      bool? useFullLink,
      String? fileExtinction}) async {
    // bool checkPermissions = await PermissionsHelper.checkPermission();
    // if (!checkPermissions) {
    //   logger.e("checkPermissions error");
    //   return "checkPermissions error";
    // }

    final path = await getPathById(tikTokVideo.videoData!.id ?? '',
        fileExtinction: fileExtinction);
    final link = processLink(linkModel.url ?? '');

    DownloadItem item = DownloadItem(
      video: tikTokVideo,
      status: DownloadStatus.downloading,
      path: path,
    );
    SaveVideoParams params = SaveVideoParams(savePath: path, videoLink: link);
    int index = checkIfItemIsExistInDownloads(item);
    addItem(index, item);

    try {
      final result = await saveVideo(
        videoLink: params.videoLink,
        savePath: params.savePath,
      );

      updateItem(index, item.copyWith(status: DownloadStatus.success));
      return result;
    } catch (e) {
      updateItem(index, item.copyWith(status: DownloadStatus.error));
      rethrow;
    }
  }

  Future<Response> download({
    required String downloadLink,
    required String savePath,
    Map<String, dynamic>? queryParams,
  }) async {
    return await client.download(downloadLink, savePath);
  }

  Future<String> saveVideo(
      {required String videoLink,
      required String savePath,
      String? fileExtinction}) async {
    try {
      var response =
          await download(savePath: savePath, downloadLink: videoLink);

      SaveResult result = await DirHelper.saveVideoToGallery(
          videoPath: savePath, fileExtinction: fileExtinction);
      // await DirHelper.removeFileFromDownloadsDir(savePath);
      logger.i("result $result $response");
      return "Download success";
    } catch (error) {
      logger.e("Download filed $error");
      rethrow;
    }
  }

  Future<String> getPathById(String id, {String? fileExtinction}) async {
    final appPath = await DirHelper.getAppPath();
    return "$appPath/$id.${fileExtinction ?? 'mp4'}";
  }

  int checkIfItemIsExistInDownloads(DownloadItem item) {
    int index = -1;
    for (int i = 0; i < newDownloads.length; i++) {
      if (newDownloads[i].video == item.video) {
        index = i;
        return index;
      }
    }
    return index;
  }

  String processLink(String link, {bool? useFullLink}) {
    if (useFullLink == false) {
      bool isCorrectLink = link.endsWith(".mp4");
      if (!isCorrectLink) link += ".mp4";
    }
    return link;
  }

  updateItem(int index, DownloadItem item) {
    if (index == -1) {
      newDownloads.last = item;
    } else {
      newDownloads[index] = item;
    }
  }

  addItem(int index, DownloadItem item) {
    if (index == -1) {
      newDownloads.add(item);
    } else {
      newDownloads[index] = item.copyWith(status: DownloadStatus.downloading);
    }
  }

  List<Link> extractLinks(String htmlContent) {
    final document = html_parser.parse(htmlContent);
    List<Link> links = [];

    // Find all links with "a" tag and get href and title
    final linkElements = document.querySelectorAll('div.tk-down-link a');
    final imageElement = document.querySelector('img');

    for (var element in linkElements) {
      final title = element.text.trim();
      final url = element.attributes['href'] ?? '';
      final imageUrl = imageElement?.attributes['src'] ?? '';

      if (url.isNotEmpty && url != 'javascript:void(0);') {
        links.add(Link(title: title, url: url, imageUrl: imageUrl));
      }
    }

    for (Link link in links) {
      logger.d("------------------------------------");
      logger.i("links title  ${link.title}");
      logger.i("links url ${link.url}");
      logger.i("links imageUrl ${link.imageUrl}");
      logger.d("------------------------------------");
    }
    return links;
  }

  String extractTitle(String htmlContent) {
    final document = html_parser.parse(htmlContent);
    final h2Element = document.querySelector('#tk-search-h2');
    return h2Element?.text.trim() ?? '';
  }
}
