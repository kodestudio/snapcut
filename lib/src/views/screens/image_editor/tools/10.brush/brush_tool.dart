import 'package:flutter/material.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/10.brush/brush_preview_image.dart';
import 'package:snapcut/src/views/widgets/base/base_bottom_tool.dart';
import 'package:snapcut/src/views/widgets/tool_scaffold.dart';

class BrushTool extends StatelessWidget {
  const BrushTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ToolScaffold(
      bottomTool: BaseBottomTool(),
      previewImage: BrushPreviewImage(),
    );
  }
}
