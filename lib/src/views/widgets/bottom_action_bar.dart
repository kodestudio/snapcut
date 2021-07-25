import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapcut/src/views/widgets/action_button.dart';

class BottomActionBar extends HookConsumerWidget {
  const BottomActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(actionStateControllerProvider.notifier);
    const basePath = 'home.bottom';

    return SizedBox(
      height: 48.0,
      width: 400.0,
      child: DecoratedBox(
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.25))),
        child: Row(
          children: [
            Expanded(
              child: ActionButton(
                text: '$basePath.styles',
                state: ActionState.styles,
                onPressed: () {
                  controller.showStyles();
                },
              ),
            ),
            Expanded(
              child: ActionButton(
                text: '$basePath.tools',
                state: ActionState.tools,
                onPressed: () {
                  controller.showTools();
                },
              ),
            ),
            Expanded(
              child: ActionButton(
                text: '$basePath.exports',
                state: ActionState.exports,
                onPressed: () {
                  controller.showExports();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
