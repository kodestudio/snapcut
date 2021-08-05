import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/6.rotate/rotate_tool_controller.dart';
import 'package:snapcut/src/views/widgets/base/base_top_tool.dart';

import 'package:easy_localization/easy_localization.dart';

class RotateTopTool extends ConsumerWidget {
  const RotateTopTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rotateInfo = ref.watch(rotateToolControllerProvider);

    return BaseTopTool(
      label: 'imageEditor.tools.rotate'.tr(),
      value: rotateInfo.quarterTurns == 0
          ? 0
          : rotateInfo.quarterTurns == 1
              ? 50
              : rotateInfo.quarterTurns == 2
                  ? 100
                  : rotateInfo.quarterTurns == -1
                      ? -50
                      : -100,
    );
  }
}
