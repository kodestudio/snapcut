import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapcut/src/utils/styles.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/exports/exports_box.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/styles/styles_box.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/tools/tools_box.dart';
import 'package:snapcut/src/views/screens/image_editor/components/edited_image.dart';

class ImageView extends HookConsumerWidget {
  const ImageView({Key? key}) : super(key: key);

  double sideBarWidth(ActionState state) {
    switch (state) {
      case ActionState.none:
        return 0.0;
      case ActionState.styles:
        return kStylesBox;
      case ActionState.tools:
        return kToolsBox;
      case ActionState.exports:
        return kExportsBox;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(actionStateControllerProvider);
    final size = Size(MediaQuery.of(context).size.width + 80.0, MediaQuery.of(context).size.height);

    if (size.isBiggerLargePhone) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedSize(
            child: Container(
              width: sideBarWidth(state),
              color: Colors.transparent,
            ),
            duration: Durations.fast,
            curve: Curves.linearToEaseOut,
          ),
          const Expanded(child: EditedImage()),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(child: EditedImage()),
        AnimatedSize(
          child: Container(
            height: state == ActionState.none ? 0.0 : 80.0,
            color: Colors.transparent,
          ),
          duration: Durations.fast,
          curve: Curves.linearToEaseOut,
        ),
      ],
    );
  }
}
