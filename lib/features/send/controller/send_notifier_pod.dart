import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_share/features/send/controller/notifier/send_state_notifier.dart';
import 'package:swift_share/features/send/state/send_state.dart';

final sendStateNotifierPod =
    AsyncNotifierProvider.autoDispose<SendStateNotifier, SendState>(
  SendStateNotifier.new,
  name: 'sendStateNotifierPod',
);
