import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_control_panel_controller.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_tool_controller.dart';

class ControlGesture extends HookConsumerWidget {
  const ControlGesture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tuneToolControllerProvider.notifier);
    final tuneTool = ref.watch(tuneToolControllerProvider);
    final initPos = useState(0.0);
    final lastValue = useState(0);

    final tuneControlPanelController = ref.watch(tuneControlPanelControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final oneUnit = constraints.biggest.width / 200;
        return GestureDetector(
          onHorizontalDragStart: (details) {
            initPos.value = details.localPosition.dx;
            lastValue.value = tuneTool.tuneValue;
          },
          onHorizontalDragUpdate: (details) {
            int updateValue = 0;

            int updateUnit = (details.localPosition.dx - initPos.value) ~/ oneUnit;

            updateValue = lastValue.value + updateUnit;

            if (updateValue < -100) updateValue = -100;
            if (updateValue > 100) updateValue = 100;

            controller.updateTune(updateValue);
          },
          onVerticalDragStart: (details) {
            tuneControlPanelController.setInitPos(details.localPosition.dy);
            tuneControlPanelController.setVisible(true);
          },
          onVerticalDragUpdate: (details) {
            tuneControlPanelController.updateCurrentTuneWithType(tuneTool.tune);
            tuneControlPanelController.setLocalPosition(details.localPosition.dy);
            controller.updateType(tuneControlPanelController.currentTuneWithType!.type);
          },
          onVerticalDragEnd: (details) {
            tuneControlPanelController.updateCurrentTuneWithType(tuneTool.tune);
            tuneControlPanelController.updateLastOffset();
            tuneControlPanelController.setVisible(false);
          },
        );
      },
    );
  }
}
