import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/models/filter_tool/tool_type.dart';
import 'package:snapcut/src/utils/globals.dart';
import 'package:snapcut/src/utils/router.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/1.tune/tune_tool.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/10.brush/brush_tool.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/6.rotate/rotate_tool.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/unimplemented_tool.dart';

final toolsControllerProvider = Provider<ToolsController>((ref) => ToolsController(ref));

class ToolsController {
  const ToolsController(this.ref);

  final ProviderRef<ToolsController> ref;

  void showTool(ToolType toolType) {
    Widget tool = const SizedBox();
    bool isImplemented = true;

    switch (toolType) {
      case ToolType.tune:
        tool = const TuneTool();
        break;
      case ToolType.rotate:
        tool = const RotateTool();
        break;
      case ToolType.brush:
        tool = const BrushTool();
        break;
      default:
        isImplemented = false;
        tool = UnimplementedTool(toolType);
    }

    if (isImplemented) {
      SnapcutRouter.push(Globals.appNav.context, tool);
    } else {
      showDialog(context: Globals.appNav.context, builder: (_) => tool);
    }
  }
}
