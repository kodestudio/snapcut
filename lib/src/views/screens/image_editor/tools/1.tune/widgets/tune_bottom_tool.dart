import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_control_panel_controller.dart';
import 'package:snapcut/src/views/widgets/base/base_bottom_tool.dart';

class TuneBottomTool extends ConsumerWidget {
  const TuneBottomTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuneControlPanelController = ref.watch(tuneControlPanelControllerProvider);

    return BaseBottomTool(
      actions: [
        GestureDetector(
          onTap: () => tuneControlPanelController.setVisible(true),
          child: const SizedBox(height: 48.0, width: 48.0, child: Center(child: Icon(Icons.tune_outlined))),
        ),
      ],
    );
  }
}
