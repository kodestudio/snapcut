import 'package:flutter/material.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/1.tune/widgets/tune_bottom_tool.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/1.tune/widgets/tune_back_control_gesture.dart';
import 'package:snapcut/src/views/widgets/tool_scaffold.dart';

import 'widgets/tune_top_tool.dart';
import 'widgets/tune_control_panel.dart';

class TuneTool extends StatelessWidget {
  const TuneTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ToolScaffold(
      topTool: TuneTopTool(),
      bottomTool: TuneBottomTool(),
      backControlGesture: TuneBackControlGesture(),
      frontControlGesture: TuneControlPanel(),
    );
  }
}
