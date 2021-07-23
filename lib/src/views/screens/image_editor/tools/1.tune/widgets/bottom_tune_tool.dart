import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_control_panel_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';

class BottomTuneTool extends HookConsumerWidget {
  const BottomTuneTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuneControlPanelController = ref.watch(tuneControlPanelControllerProvider);
    final cloneImage = ref.read(cloneSnapcutImageControllerProvider);
    final mainImageController = ref.watch(snapcutImageControllerProvider.notifier);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 40.0,
        width: double.maxFinite,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const SizedBox(height: 40.0, width: 40.0, child: Center(child: Icon(Icons.close_outlined))),
            ),
            GestureDetector(
              onTap: () => tuneControlPanelController.setVisible(true),
              child: const SizedBox(height: 40.0, width: 40.0, child: Center(child: Icon(Icons.tune_outlined))),
            ),
            GestureDetector(
              onTap: () {
                mainImageController.saveImage(cloneImage.state);
                Navigator.pop(context);
              },
              child: const SizedBox(height: 40.0, width: 40.0, child: Center(child: Icon(Icons.check_outlined))),
            ),
          ],
        ),
      ),
    );
  }
}
