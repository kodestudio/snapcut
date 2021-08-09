import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/10.brush/brush_tool_controller.dart';
import 'package:snapcut/src/views/screens/image_editor/components/top_tool.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/10.brush/brush_preview_image.dart';
import 'package:snapcut/src/views/widgets/base/base_bottom_tool.dart';
import 'package:snapcut/src/views/widgets/tool_scaffold.dart';

class BrushTool extends StatelessWidget {
  const BrushTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToolScaffold(
      bottomTool: BaseBottomTool(
        actions: [
          Consumer(builder: (context, ref, _) {
            final controller = ref.watch(brushToolControllerProvider.notifier);
            return SnapcutIconButton(
              onPressed: () => controller.undo(),
              icon: const Icon(Icons.undo),
              label: 'Undo',
            );
          }),
        ],
      ),
      previewImage: const BrushPreviewImage(),
    );
  }
}
