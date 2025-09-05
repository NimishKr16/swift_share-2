import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_share/data/model/update_model.dart';
import 'package:swift_share/shared/api_client/dio/dio_client_provider.dart';
import 'package:swift_share/shared/riverpod_ext/cancel_extensions.dart';

final getUpdateModelPod = FutureProvider.autoDispose<UpdateModel?>(
  (ref) async {
    if (kDebugMode) {
      return null;
    }
    final dio = ref.watch(dioProvider(
        "https://api.github.com/repos/Shreemanarjun/swift_share"));
    final result = await dio.get(
      '/releases/latest',
      cancelToken: ref.cancelToken(),
    );
    return UpdateModel.fromMap(result.data);
  },
  name: 'getUpdateModelPod',
);
