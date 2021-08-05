import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/6.rotate/rotate_tool_controller.dart';
import 'package:snapcut/src/views/screens/image_editor/components/top_tool.dart';
import 'package:snapcut/src/views/widgets/base/base_bottom_tool.dart';

class RotateBottomTool extends ConsumerWidget {
  const RotateBottomTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(rotateToolControllerProvider.notifier);
    final rotateInfo = ref.watch(rotateToolControllerProvider);

    return BaseBottomTool(
      actions: [
        SnapcutIconButton(
          icon: const Icon(Icons.rotate_left_outlined),
          label: 'imageEditor.tools.rotateChildren.rotateLeft',
          onPressed: () {
            controller.rotate(rotateInfo.quarterTurns - 1);
            controller.rerenderImage();
          },
        ),
        SnapcutIconButton(
          icon: const Icon(Icons.flip_outlined),
          label: 'imageEditor.tools.rotateChildren.flipHorizontal',
          onPressed: () {
            controller.flip(Axis.horizontal);
            controller.rerenderImage();
          },
        ),
        SnapcutIconButton(
          icon: const RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.flip_outlined),
          ),
          label: 'imageEditor.tools.rotateChildren.flipVertical',
          onPressed: () {
            controller.flip(Axis.vertical);
            controller.rerenderImage();
          },
        ),
        SnapcutIconButton(
          icon: const Icon(Icons.rotate_right_outlined),
          label: 'imageEditor.tools.rotateChildren.rotateRight',
          onPressed: () {
            controller.rotate(rotateInfo.quarterTurns + 1);
            controller.rerenderImage();
          },
        ),
      ],
    );
  }
}
