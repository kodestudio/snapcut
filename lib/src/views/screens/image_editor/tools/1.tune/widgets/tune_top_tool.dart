import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_tool_controller.dart';
import 'package:snapcut/src/views/widgets/base/base_top_tool.dart';

class TuneTopTool extends ConsumerWidget {
  const TuneTopTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuneWithType = ref.watch(tuneToolControllerProvider);
    return BaseTopTool(label: tuneWithType.typeTextWithTuneValue, value: tuneWithType.tuneValue);
  }
}
