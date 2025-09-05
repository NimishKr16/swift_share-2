import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_share/data/model/sender_model.dart';
import 'package:swift_share/data/service/receiver/receiver_service_pod.dart';
import 'package:swift_share/features/receive/state/connect_btn_state_pod.dart';
import 'package:swift_share/shared/riverpod_ext/cancel_extensions.dart';


class ConnectBtnNotifier
    extends AutoDisposeFamilyAsyncNotifier<ConnectBtnState, SenderModel> {
  @override
  FutureOr<ConnectBtnState> build(SenderModel arg) {
    return UnconnectedState();
  }

  Future<void> connectToDevice() async {
    state = AsyncData(ConnectingState());
    state = await AsyncValue.guard(() async {
      final receiverService = ref.watch(receiverServicePod(arg));
     // final currentIP = await NetworkDiscovery.discoverDeviceIpAddress();
      final result = await receiverService.connectToDevice(
        ip: arg.ip.toString(),
        port: arg.port.toString(),
        currentIP: "currentIP",
        cancelToken: ref.cancelToken(),
      );
      return result.when((isAccepted) {
        ref.keepAlive();
        return ConenctionAcceptanceState(isAccepted: isAccepted);
      }, (error) {
        return ConnectionFailedState(message: error.message);
      });
    });
  }
}
