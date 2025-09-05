import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_share/data/model/sender_model.dart';
import 'package:swift_share/features/receive/controller/notifier/connect_btn_notifier.dart';
import 'package:swift_share/features/receive/state/connect_btn_state_pod.dart';

final connectBtnPod = AsyncNotifierProvider.autoDispose
    .family<ConnectBtnNotifier, ConnectBtnState, SenderModel>(
        ConnectBtnNotifier.new);
