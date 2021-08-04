import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/compare_image_controller.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_tool_controller.dart';
import 'package:snapcut/src/utils/utils.dart';

class TopTuneTool extends HookConsumerWidget {
  const TopTuneTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuneWithType = ref.watch(tuneToolControllerProvider);
    final isCompare = ref.watch(compareImageControllerProvider);

    return SafeArea(
      child: SizedBox(
        height: 56.0,
        child: Column(
          children: [
            _progressBar(context, tuneWithType),
            _statusBar(context, tuneWithType, isCompare),
          ],
        ),
      ),
    );
  }

  Widget _progressBar(BuildContext context, TuneWithType tuneWithType) {
    return SizedBox(
      height: 16.0,
      width: double.maxFinite,
      child: Stack(
        children: [
          Container(
            height: 8.0,
            width: double.maxFinite,
            color: Theme.of(context).colorScheme.progressBar,
          ),
          LayoutBuilder(
            builder: (context, constraints) => Row(
              children: [
                SizedBox(
                  height: 8.0,
                  width: constraints.biggest.width / 2,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 8.0,
                      width: tuneWithType.tuneValue < 0 ? (constraints.biggest.width / 2 * -tuneWithType.tuneValue / 100) : 0.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                  width: constraints.biggest.width / 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 8.0,
                      width: tuneWithType.tuneValue >= 0 ? (constraints.biggest.width / 2 * tuneWithType.tuneValue / 100) : 0.0,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColoredBox(
                color: Theme.of(context).colorScheme.progressBarIndicator,
                child: const SizedBox(height: 8.0, width: 1.0),
              ),
              ColoredBox(
                color: Theme.of(context).colorScheme.progressBarIndicator,
                child: const SizedBox(height: 16.0, width: 1.5),
              ),
              ColoredBox(
                color: Theme.of(context).colorScheme.progressBarIndicator,
                child: const SizedBox(height: 8.0, width: 1.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusBar(
    BuildContext context,
    TuneWithType tuneWithType,
    StateController<bool> isCompare,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(height: 40.0, width: 40.0, color: Colors.transparent),
        Container(
          height: 30.0,
          padding: const EdgeInsets.symmetric(horizontal: Insets.l),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background.withOpacity(0.75),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            tuneWithType.typeTextWithTuneValue,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        SizedBox(
          height: 40.0,
          width: 40.0,
          child: Center(
            child: GestureDetector(
              onTapDown: (_) => isCompare.state = true,
              onTapUp: (_) => isCompare.state = false,
              child: const Icon(Icons.compare_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
