import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapcut/src/utils/styles.dart';

const double kStylesBox = 112.0;

class StylesBox extends HookConsumerWidget {
  const StylesBox({Key? key}) : super(key: key);

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
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 80.0,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
