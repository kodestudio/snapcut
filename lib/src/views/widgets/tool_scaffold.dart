import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/compare_image_controller.dart';
import 'package:snapcut/src/views/screens/image_editor/components/preview_image.dart';

class ToolScaffold extends ConsumerWidget {
  const ToolScaffold({
    Key? key,
    this.topTool,
    this.bottomTool,
    this.previewImage,
    this.controlGesture,
    this.controlPanel,
  }) : super(key: key);

  final Widget? topTool;
  final Widget? bottomTool;
  final Widget? previewImage;
  final Widget? controlGesture;
  final Widget? controlPanel;

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
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: previewImage ?? PreviewImage(isCompareImage: isCompare.state),
              ),
              if (controlGesture != null) controlGesture!,
              if (topTool != null) topTool!,
              if (bottomTool != null) bottomTool!,
              if (controlPanel != null) controlPanel!,
            ],
          ),
        ),
      ),
    );
  }
}
