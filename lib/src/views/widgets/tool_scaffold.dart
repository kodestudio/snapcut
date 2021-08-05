import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/compare_image_controller.dart';
import 'package:snapcut/src/views/screens/image_editor/components/edited_image.dart';

class ToolScaffold extends ConsumerWidget {
  const ToolScaffold({
    Key? key,
    required this.topTool,
    required this.bottomTool,
    this.backControlGesture,
    this.frontControlGesture,
  }) : super(key: key);

  final Widget topTool;
  final Widget bottomTool;
  final Widget? backControlGesture;
  final Widget? frontControlGesture;

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
                child: EditedImage(isCompareImage: isCompare.state),
              ),
              if (backControlGesture != null) backControlGesture!,
              topTool,
              bottomTool,
              if (frontControlGesture != null) frontControlGesture!,
            ],
          ),
        ),
      ),
    );
  }
}
