import 'package:aghanilyrics/tiktok_downloader/models/AnalysisResponseModel.dart';
import 'package:aghanilyrics/tiktok_downloader/utils/app_enums.dart';


import 'tiktok_video.dart';
import 'package:equatable/equatable.dart';

class DownloadItem extends Equatable {
  final AnalysisResponseModel video;
  final DownloadStatus status;
  final String path;

  const DownloadItem({required this.video, required this.status, required this.path});

  DownloadItem copyWith({AnalysisResponseModel? video, DownloadStatus? status, String? path}) {
    return DownloadItem(
      video: video ?? this.video,
      status: status ?? this.status,
      path: path ?? this.path,
    );
  }

  @override
  List<Object> get props => [video, status, path];
}
