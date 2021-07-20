import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';
import 'package:snapcut/src/views/widgets/bottom/action_button.dart';

class BottomActionBar extends HookConsumerWidget {
  const BottomActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomTools = ref.watch(bottomActionStateProvider.notifier);

    return SizedBox(
      height: 48.0,
      width: 400.0,
      child: DecoratedBox(
        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: Row(
          children: [
            Expanded(
              child: ActionButton(
                text: 'KIỂU',
                action: BottomAction.styles,
                onPressed: () {
                  bottomTools.showStyles();
                },
              ),
            ),
            Expanded(
              child: ActionButton(
                text: 'CÔNG CỤ',
                action: BottomAction.tools,
                onPressed: () {
                  bottomTools.showTools();
                },
              ),
            ),
            Expanded(
              child: ActionButton(
                text: 'XUẤT',
                action: BottomAction.exports,
                onPressed: () {
                  bottomTools.showExports();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
