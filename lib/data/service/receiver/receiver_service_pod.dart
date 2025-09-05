import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_share/data/model/sender_model.dart';
import 'package:swift_share/data/service/receiver/receiver_service.dart';
import 'package:swift_share/shared/api_client/dio/dio_client_provider.dart';

final receiverServicePod =
    Provider.autoDispose.family<ReceiverService, SenderModel>(
  (ref, sendermodel) {
    return ReceiverService(
      dio: ref.watch(
        dioProvider('http://${sendermodel.ip}:${sendermodel.port}'),
      ),
    );
  },
  name: 'receiverServicePod',
);
