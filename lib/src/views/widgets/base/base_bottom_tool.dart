import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';

class BaseBottomTool extends ConsumerWidget {
  const BaseBottomTool({
    Key? key,
    this.onClose,
    this.onAccept,
    this.actions,
  }) : super(key: key);

  final VoidCallback? onClose;
  final VoidCallback? onAccept;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cloneImageController = ref.watch(cloneSnapcutImageControllerProvider.notifier);
    final mainImageController = ref.watch(snapcutImageControllerProvider.notifier);
    final mainImage = ref.watch(snapcutImageControllerProvider);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 48.0,
        width: double.maxFinite,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                onClose?.call();
                cloneImageController.state = mainImage!.clone();
                Navigator.pop(context);
              },
              child: const SizedBox(height: 48.0, width: 48.0, child: Center(child: Icon(Icons.close_outlined))),
            ),
            if (actions != null) ...actions!,
            GestureDetector(
              onTap: () {
                onAccept?.call();
                mainImageController.saveImage(cloneImageController.state);
                Navigator.pop(context);
              },
              child: const SizedBox(height: 48.0, width: 48.0, child: Center(child: Icon(Icons.check_outlined))),
            ),
          ],
        ),
      ),
    );
  }
}
