import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapseed/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapseed/src/utils/styles.dart';
import 'package:snapseed/src/views/screens/image_editor/components/edited_image.dart';

class ImageView extends HookConsumerWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bottomActionStateProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: InteractiveViewer(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 56.0),
              child: const Padding(
                padding: EdgeInsets.only(left: Insets.l, right: Insets.l, top: Insets.m, bottom: Insets.l),
                child: EditedImage(),
              ),
            ),
          ),
        ),
        AnimatedSize(
          child: Container(
            height: state == BottomAction.none ? 0.0 : 80.0,
            color: Colors.transparent,
          ),
          duration: Durations.fast,
          curve: Curves.linearToEaseOut,
        ),
      ],
    );
  }
}
