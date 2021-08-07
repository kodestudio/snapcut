import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/10.brush/brush_tool_controller.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/utils/utils.dart';

class BrushPreviewImage extends HookConsumerWidget {
  const BrushPreviewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cloneSnapcutImage = ref.watch(cloneSnapcutImageControllerProvider);
    final controller = ref.watch(brushToolControllerProvider.notifier);
    final brushInfo = ref.watch(brushToolControllerProvider);
    final currentBrushType = ref.watch(currentBrushTypeProvider);

    return InteractiveViewer(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.only(left: Insets.l, right: Insets.l, top: Insets.m, bottom: Insets.l),
          child: Stack(
            children: [
              StreamBuilder<Widget?>(
                stream: cloneSnapcutImage.state.image,
                builder: (context, snapshot) {
                  if (snapshot.data == null) return const Center(child: CircularProgressIndicator());
                  return Center(
                    child: Builder(
                      builder: (context) {
                        return GestureDetector(
                          onPanUpdate: (details) {
                            final size = (context.findRenderObject() as RenderBox).size;
                            final localPosition = details.localPosition;
                            final ratio = Offset(localPosition.dx / size.width, localPosition.dy / size.height);
                            if (ratio.dx <= 1.0 && ratio.dy <= 1.0 && ratio.dx >= 0.0 && ratio.dy >= 0.0) {
                              controller.updateInfo(
                                currentBrushType.state.type,
                                offset: ratio,
                                level: currentBrushType.state.level,
                              );
                              controller.rerenderImage();
                            }
                          },
                          child: snapshot.data,
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
