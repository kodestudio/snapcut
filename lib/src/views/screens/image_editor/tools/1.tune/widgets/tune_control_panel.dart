import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_control_panel_controller.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_tool_controller.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune_type.dart';
import 'package:snapcut/src/utils/styles.dart';

class TuneControlPanel extends HookConsumerWidget {
  const TuneControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(tuneControlPanelControllerProvider);
    final tuneTool = ref.watch(tuneToolControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        controller.minOffset = (constraints.biggest.height - 48) / 2 - Insets.sm - 48 * 6.0;
        controller.maxOffset = (constraints.biggest.height - 48) / 2 - Insets.sm;

        return Stack(
          children: [
            _buildMenu(
              context,
              tune: tuneTool.tune,
              size: constraints.biggest,
              visible: controller.visible,
              currentOffset: controller.currentOffset,
            ),
            Center(
              child: AnimatedOpacity(
                key: const ValueKey('Tune state'),
                duration: Durations.fastest,
                opacity: controller.visible ? 1.0 : 0.0,
                child: Container(
                  height: 48.0,
                  width: 300,
                  color: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        (controller.currentTuneWithType ?? tuneTool).typeText,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                      Text(
                        (controller.currentTuneWithType ?? tuneTool).tuneValue.toString(),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenu(
    BuildContext context, {
    required Tune tune,
    required Size size,
    required double currentOffset,
    required bool visible,
  }) {
    return Positioned(
      top: currentOffset,
      left: 0.0,
      right: 0.0,
      child: Center(
        child: AnimatedOpacity(
          duration: Durations.fast,
          opacity: visible ? 1.0 : 0.0,
          curve: Curves.linearToEaseOut,
          child: IgnorePointer(
            child: Container(
              height: 48 * 7.0 + Insets.m,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.m / 2),
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var type in TuneType.values)
                    SizedBox(
                      key: ValueKey(type),
                      height: 48.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Insets.l),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(TuneWithType(tune, type).typeText),
                            Text(TuneWithType(tune, type).tuneValue.toString()),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
