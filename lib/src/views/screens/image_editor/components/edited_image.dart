import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';
import 'package:snapcut/src/models/snapcut_image/snapcut_image.dart';
import 'package:snapcut/src/utils/utils.dart';

class EditedImage extends HookConsumerWidget {
  const EditedImage({
    Key? key,
    this.isCompareImage = false,
    this.fullscreen = false,
    this.replaceImage,
  })  : assert((isCompareImage == true && replaceImage == null) || (isCompareImage == false)),
        super(key: key);

  final bool isCompareImage;
  final bool fullscreen;
  final SnapcutImage? replaceImage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapcutImage = ref.watch(snapcutImageControllerProvider)!;
    final cloneSnapcutImage = ref.watch(cloneSnapcutImageControllerProvider);

    return InteractiveViewer(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + (fullscreen ? 0.0 : 56.0)),
        child: Padding(
          padding: const EdgeInsets.only(left: Insets.l, right: Insets.l, top: Insets.m, bottom: Insets.l),
          child: Stack(
            children: [
              StreamBuilder<Widget?>(
                stream: (isCompareImage == false ? cloneSnapcutImage.state : (replaceImage ?? snapcutImage)).image,
                builder: (context, snapshot) {
                  if (snapshot.data == null) return const Center(child: CircularProgressIndicator());
                  return Center(child: snapshot.data);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
