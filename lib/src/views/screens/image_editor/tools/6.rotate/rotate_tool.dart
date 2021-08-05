import 'package:flutter/material.dart';
import 'package:snapcut/src/views/widgets/tool_scaffold.dart';

import './widgets/widgets.dart';

class RotateTool extends StatelessWidget {
  const RotateTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ToolScaffold(
      topTool: RotateTopTool(),
      bottomTool: RotateBottomTool(),
    );
  }
}
