import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapcut/src/utils/styles.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/styles/styles_box.dart';

class   ImageEditorToolBox extends HookConsumerWidget {
  const ImageEditorToolBox({Key? key}) : super(key: key);

  double _position(ActionState state) {
    switch (state) {
      case ActionState.none:
        return -kStylesBox;
      case ActionState.styles:
        return 0.0;
      case ActionState.tools:
        return -kStylesBox;
      case ActionState.exports:
        return -kStylesBox;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(actionStateControllerProvider);
    return AnimatedPositioned(
      curve: Curves.linearToEaseOut,
      duration: Durations.fast,
      bottom: _position(state),
      child: state == ActionState.styles ? const StylesBox() : const SizedBox(),
    );
  }
}
    