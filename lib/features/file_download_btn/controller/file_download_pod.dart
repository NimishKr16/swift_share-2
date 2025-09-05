import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_share/data/model/file_paths_model.dart';
import 'package:swift_share/features/file_download_btn/controller/notifier/file_download_notifier.dart';
import 'package:swift_share/features/file_download_btn/state/file_download_state.dart';

final fileDownloaderPod = AsyncNotifierProvider.autoDispose
    .family<FileDownloaderNotifier, DownloadState, FilePath>(
        FileDownloaderNotifier.new);
