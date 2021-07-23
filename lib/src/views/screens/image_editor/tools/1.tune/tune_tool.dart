import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/compare_image_controller.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_tool_controller.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/1.tune/widgets/bottom_tune_tool.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/1.tune/widgets/control_gesture.dart';
import 'package:snapcut/src/views/screens/image_editor/components/edited_image.dart';

import 'widgets/top_tune_tool.dart';
import 'widgets/tune_control_panel.dart';

class TuneTool extends HookConsumerWidget {
  const TuneTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompare = ref.watch(compareImageControllerProvider);

    return Scaffold(
      body: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              EditedImage(isCompareImage: isCompare.state),
              const ControlGesture(),
              const TopTuneTool(),
              const BottomTuneTool(),
              const TuneControlPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
