import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';

class SideActionBar extends HookConsumerWidget {
  const SideActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapcutImageController = ref.watch(snapcutImageControllerProvider.notifier);

    return SizedBox(
      width: 80.0,
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
            onPressed: () {},
            tooltip: 'home.bottom.styles'.tr(),
          ),
          IconButton(
            icon: const Icon(Icons.construction_outlined),
            onPressed: () {},
            tooltip: 'home.bottom.tools'.tr(),
          ),
          IconButton(
            icon: const Icon(Icons.file_download_outlined),
            onPressed: () {},
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
