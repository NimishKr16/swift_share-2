import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_share/data/model/file_select_model.dart';
import 'package:swift_share/features/file_selector/controller/notifier/selected_files_notifier.dart';

final selectedFilesPod =
    NotifierProvider.autoDispose<FilesListNotifier, List<FileSelectModel>>(
  FilesListNotifier.new,
  name: 'selectedFilesPod',
);
