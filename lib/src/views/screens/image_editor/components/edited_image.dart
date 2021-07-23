import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';
import 'package:snapcut/src/utils/utils.dart';

class EditedImage extends HookConsumerWidget {
  const EditedImage({Key? key, this.isCompareImage = false}) : super(key: key);

  final bool isCompareImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapcutImage = ref.watch(snapcutImageControllerProvider)!;
    final cloneSnapcutImage = ref.watch(cloneSnapcutImageControllerProvider);

    return InteractiveViewer(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 56.0),
        child: Padding(
          padding: const EdgeInsets.only(left: Insets.l, right: Insets.l, top: Insets.m, bottom: Insets.l),
          child: Stack(
            children: [
              Center(child: (isCompareImage == false ? cloneSnapcutImage.state : snapcutImage).image),
            ],
          ),
        ),
      ),
    );
  }
}
