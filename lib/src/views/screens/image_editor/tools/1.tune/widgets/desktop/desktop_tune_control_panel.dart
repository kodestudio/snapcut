import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_tool_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';
import 'package:snapcut/src/models/image_editor/tools/1.tune/tune_type.dart';
import 'package:snapcut/src/models/snapcut_image/snapcut_image.dart';
import 'package:snapcut/src/utils/styles.dart';
import 'package:snapcut/src/views/screens/image_editor/components/top_tool.dart';
import 'package:snapcut/src/views/widgets/snapcut_slider.dart';

class DesktopTuneControlPanel extends HookConsumerWidget {
  const DesktopTuneControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final open = useState(false);
    final tuneTool = ref.watch(tuneToolControllerProvider);
    final controller = ref.watch(tuneToolControllerProvider.notifier);
    final cloneImageController = ref.watch(cloneSnapcutImageControllerProvider.notifier);
    final mainImageController = ref.watch(snapcutImageControllerProvider.notifier);
    final mainImage = ref.watch(snapcutImageControllerProvider);

    return Positioned(
      right: 0.0,
      left: 0.0,
      bottom: 0.0,
      child: Center(
        child: AnimatedContainer(
          duration: Durations.medium,
          curve: Curves.linearToEaseOut,
          decoration: BoxDecoration(
            color: (open.value ? Theme.of(context).scaffoldBackgroundColor : Theme.of(context).colorScheme.primary).withOpacity(0.8),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(Insets.m)),
          ),
          width: open.value ? 500.0 : 80.0,
          height: open.value ? 300.0 : 48.0,
          alignment: Alignment.center,
          child: TweenAnimationBuilder<double>(
            duration: Durations.fast,
            tween: Tween(begin: 0.0, end: open.value ? 1.0 : 0.0),
            builder: (context, opacity, child) {
              return Stack(
                children: [
                  Center(
                    child: Opacity(
                      opacity: 1 - opacity,
                      child: IconButton(
                        onPressed: () => open.value = true,
                        icon: const Icon(Icons.construction_outlined),
                      ),
                    ),
                  ),
                  _buildPanel(
                    context,
                    opacity: opacity,
                    open: open,
                    tuneTool: tuneTool,
                    controller: controller,
                    cloneImageController: cloneImageController,
                    mainImageController: mainImageController,
                    mainImage: mainImage!,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Opacity _buildPanel(
    BuildContext context, {
    required double opacity,
    required ValueNotifier<bool> open,
    required TuneWithType tuneTool,
    required TuneToolController controller,
    required StateController<SnapcutImage> cloneImageController,
    required SnapcutImageController mainImageController,
    required SnapcutImage mainImage,
  }) {
    return Opacity(
      opacity: opacity,
      child: IgnorePointer(
        ignoring: !open.value,
        child: Column(
          children: [
            if (open.value && opacity > 0.4) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Insets.m, vertical: Insets.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SnapcutIconButton(
                      onPressed: () {
                        cloneImageController.state = mainImage.clone();
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close_outlined),
                      label: 'utils.cancel',
                    ),
                    SnapcutIconButton(
                      onPressed: () => open.value = false,
                      icon: const Icon(Icons.fullscreen_exit_outlined),
                      label: 'utils.minimize',
                    ),
                    SnapcutIconButton(
                      onPressed: () {
                        mainImageController.saveImage(cloneImageController.state);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check),
                      label: 'utils.apply',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
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
                              Text(TuneWithType(tuneTool.tune, type).typeText),
                              SizedBox(
                                width: 200.0,
                                child: SnapcutSlider(
                                  onSlide: (value) => controller.updateTuneWithType(tuneTool.update(type, value)),
                                  value: TuneWithType(tuneTool.tune, type).tuneValue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
