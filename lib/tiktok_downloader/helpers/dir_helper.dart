import 'dart:io';

// import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saver_gallery/saver_gallery.dart';

class DirHelper {
  static Future<String> getAppPath() async {
    String mainPath = await _getMainPath();
    String appPath = "${mainPath}Download/TikTokVideos";
    _createPathIfNotExist(appPath);
    return appPath;
  }

  static Future<String> _getMainPath() async {
    String appDownloadsPath = "";
    if (Platform.isAndroid) {
      final dir = await getExternalStorageDirectory();
      List<String> paths = dir!.path.split('/');
      for (var i in paths) {
        if (i == "Android") break;
        appDownloadsPath += "$i/";
      }
    } else {
      final dir = await getApplicationDocumentsDirectory();
      appDownloadsPath = dir.path;
    }
    return appDownloadsPath;
  }

  static Future<void> _createPathIfNotExist(String path) async {
    if (!await Directory(path).exists()) {
      await Directory(path).create(recursive: true);
    }
  }

  static Future<SaveResult> saveVideoToGallery({
   required String videoPath
}) async {
    final result = await SaverGallery.saveFile(
      skipIfExists: true,
      fileName: '${DateTime.now().microsecondsSinceEpoch}_TikTok_downloads.mp4',
      androidRelativePath: "TikTok_downloads", filePath: videoPath,
    );
    return result;
  }

  static Future<void> removeFileFromDownloadsDir(videoPath) async {
    await File(videoPath).delete();
  }
}
