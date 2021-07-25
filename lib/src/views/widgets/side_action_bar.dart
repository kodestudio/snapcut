import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';

const kSideActionBar = 56.0;

//TODO: Waiting final design for desktop screen

class SideActionBar extends HookConsumerWidget {
  const SideActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapcutImageController = ref.watch(snapcutImageControllerProvider.notifier);
    final controller = ref.watch(actionStateControllerProvider.notifier);

    return Container(
      decoration: BoxDecoration(border: Border(right: BorderSide(color: Theme.of(context).disabledColor, width: 0.5))),
      width: kSideActionBar,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
              ),
              foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onPressed: () => snapcutImageController.openImage(),
            child: Text('home.top.open'.tr()),
          ),
          IconButton(
            icon: const Icon(Icons.style_outlined),
            onPressed: () => controller.showStyles(),
            tooltip: 'home.bottom.styles'.tr(),
          ),
          IconButton(
            icon: const Icon(Icons.construction_outlined),
            onPressed: () => controller.showTools(),
            tooltip: 'home.bottom.tools'.tr(),
          ),
          IconButton(
            icon: const Icon(Icons.file_download_outlined),
            onPressed: () => controller.showExports(),
            tooltip: 'home.bottom.exports'.tr(),
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
              ),
              foregroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.onBackground,
              ),
            ),
            onPressed: () => snapcutImageController.openImage(),
            child: Text('home.top.open'.tr()),
          ),
        ],
      ),
    );
  }
}
