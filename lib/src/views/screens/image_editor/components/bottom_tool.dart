import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/styles/styles_box.dart';

class BottomTool extends HookConsumerWidget {
  const BottomTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const StylesBox();
  }
}
