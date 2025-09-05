import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/annotations.dart';

import 'package:flutter/material.dart';

import 'package:swift_share/shared/widget/app_locale_popup.dart';
import 'package:swift_share/translation_pod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:swift_share/features/settings/view/widget/about_app_tile.dart';
import 'package:swift_share/features/theme_segmented_btn/view/theme_segmented_btn.dart';

@RoutePage(
  deferredLoading: true,
)
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(translationsPod);
    return Scaffold(
      appBar: AppBar(
        title: t.settingsPage.text.make(),
      ),
      bottomNavigationBar: BottomSheet(
        onClosing: () {},
        builder: (context) => const AboutAppTile(),
        enableDrag: false,
        showDragHandle: false,
      ).safeArea(),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        children: [
          // ListTile(
          //   title: t.changeLanguage.text.bold.make(),
          //   trailing: const AppLocalePopUp(),
          // ),
          // ListTile(
          //   title: t.switchTheme.text.bold.make(),
          //   trailing: const ThemeSegmentedBtn(),
          // ),
        ],
      ),
    );
  }
}
