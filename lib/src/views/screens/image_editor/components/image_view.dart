import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapcut/src/utils/styles.dart';
import 'package:snapcut/src/views/screens/image_editor/components/preview_image.dart';

class ImageView extends HookConsumerWidget {
  const ImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(actionStateControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(child: PreviewImage()),
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
