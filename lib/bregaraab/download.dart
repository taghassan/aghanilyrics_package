import 'dart:io';

import 'package:aghanilyrics/bregaraab/models/SongsModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class BADownloadManager{

  final logger = Logger();
  var downloadValue = 0.0;

  Future<bool> fileExist(Songs? song) async {
    String savePath = await getDownloadPath("${song?.songName}");
    savePath = "$savePath/${song?.songName}.mp3";
    return await File(savePath).exists();
  }

  Future download(Songs? song, int songIndex) async {
    try {
      if (!(await fileExist(song))) {
        // isLoading[songIndex] = 1;
        Dio dio = Dio();
        String savePath = await getDownloadPath("${song?.songName}");
        savePath = "$savePath/${song?.songName}.mp3";

        var response = await dio.get(
          "${song?.url}",
          onReceiveProgress: showDownloadProgress,
          //Received data with List<int>
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }),
        );

        // File(savePath)
        //  .writeAsBytesSync(response.data);

        // print(response.headers);
        File file = File(savePath);
        var raf = file.openSync(mode: FileMode.write);
        // response.data is List<int> type
        raf.writeFromSync(response.data);
        await raf.close();
        // isLoading[songIndex] = 2;
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        logger.e('Failed to get platform version. ${e.toString()}');
      }
      return false;
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      logger.i((received / total * 100).toStringAsFixed(0) + "%");
      downloadValue = (received / total * 100);

    }
  }

  Future<String> getDownloadPath(String? uniqueId) async {
    try {
      var tempDir = await getApplicationDocumentsDirectory();

      String path = "${tempDir.path}/$uniqueId";
      if (!(await Directory(path).exists())) {
        await Directory(path).create();
        logger.i("New Directory Created !");
      }

      String fullPath = path;

      return fullPath;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        logger.e('Failed to get platform version. ${e.message}');
      }
      return 'Failed to get platform version.';
    }
  }


}