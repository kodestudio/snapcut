import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/image_editor_controller.dart';

class ActionButton extends ConsumerWidget {
  const ActionButton({
    Key? key,
    required this.text,
    required this.state,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final ActionState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentState = ref.watch(actionStateControllerProvider);

    return SizedBox(
      height: 48.0,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
          minimumSize: MaterialStateProperty.all(const Size(48.0, 48.0)),
          foregroundColor: MaterialStateProperty.all(
            currentState == state ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onBackground,
          ),
        ),
        onPressed: onPressed,
        child: Text(text.tr()),
      ),
    );
  }
}
