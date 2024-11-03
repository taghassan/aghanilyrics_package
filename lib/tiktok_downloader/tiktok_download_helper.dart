import 'dart:io';

import 'package:aghanilyrics/dio_logger.dart';
import 'package:aghanilyrics/tiktok_downloader/helpers/dir_helper.dart';
import 'package:aghanilyrics/tiktok_downloader/helpers/permissions_helper.dart';
import 'package:aghanilyrics/tiktok_downloader/models/download_item.dart';
import 'package:aghanilyrics/tiktok_downloader/models/save_video_params.dart';
import 'package:aghanilyrics/tiktok_downloader/models/tiktok_video.dart';
import 'package:aghanilyrics/tiktok_downloader/models/tiktok_video_model.dart';
import 'package:aghanilyrics/tiktok_downloader/models/video_item.dart';
import 'package:aghanilyrics/tiktok_downloader/utils/app_enums.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
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
        final thumbnailPath ="";
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



  Future<String> saveVideoLink({required TikTokVideo tikTokVideo}) async {
    // bool checkPermissions = await PermissionsHelper.checkPermission();
    // if (!checkPermissions) {
    //   logger.e("checkPermissions error");
    //   return "checkPermissions error";
    // }
    final path = await getPathById(tikTokVideo.videoData!.id);
    final link = processLink(tikTokVideo.videoData!.playVideo);
    DownloadItem item = DownloadItem(
      video: tikTokVideo,
      status: DownloadStatus.downloading,
      path: path,
    );
    SaveVideoParams params = SaveVideoParams(savePath: path, videoLink: link);
    int index = checkIfItemIsExistInDownloads(item);
    addItem(index, item);


    try{

      final result = await saveVideo(
        videoLink: params.videoLink,
        savePath: params.savePath,
      );

      updateItem(index, item.copyWith(status: DownloadStatus.success));
      return result;
    }catch(e){
      updateItem(index, item.copyWith(status: DownloadStatus.error));
      return "error";
    }
  }

  Future<Response> download({
    required String downloadLink,
    required String savePath,
    Map<String, dynamic>? queryParams,
  }) async {
    return await client.download(downloadLink, savePath);
  }

  Future<String> saveVideo({
    required String videoLink,
    required String savePath,
  }) async {
    try {
      await download(savePath: savePath, downloadLink: videoLink);
      return "Download success";
    } catch (error) {
      rethrow;
    }
  }

  Future<String> getPathById(String id) async {
    final appPath = await DirHelper.getAppPath();
    return "$appPath/$id.mp4";
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

  String processLink(String link) {
    bool isCorrectLink = link.endsWith(".mp4");
    if (!isCorrectLink) link += ".mp4";
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
}
