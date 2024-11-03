
import 'package:aghanilyrics/tiktok_downloader/models/tiktok_video.dart';
import 'package:aghanilyrics/tiktok_downloader/models/tiktok_video_model.dart';
import 'package:aghanilyrics/tiktok_downloader/models/video_data.dart';
import 'package:aghanilyrics/tiktok_downloader/models/video_data_model.dart';

extension TiktokVideoExtension on TiktokVideoModel {
  TikTokVideo toDomain() => TikTokVideo(
        code: code,
        msg: msg,
        processedTime: processedTime,
        videoData: videoData,
      );
}

extension VideoDataExtension on VideoDataModel {
  VideoData toDomain() => VideoData(
        id: id,
        duration: duration,
        title: title,
        originCover: originCover,
        playVideo: playVideo,
        wmPlayVideo: wmPlayVideo,
        music: music,
        playCount: playCount,
        downloadCount: downloadCount,
      );
}
