import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/tools_controller.dart';
import 'package:snapcut/src/models/filter_tool/tool_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:snapcut/src/utils/styles.dart';

class ToolGridTile extends HookConsumerWidget {
  const ToolGridTile({
    Key? key,
    required this.toolType,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final ToolType toolType;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toolsController = ref.read(toolsControllerProvider);
    const double scale = 1.34;

    return Transform.scale(
      scale: scale,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Center(
            child: Transform.scale(
              scale: 1 / scale,
              child: SizedBox(
                height: 80,
                width: 72,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        child: Icon(icon, size: 24),
                        alignment: Alignment.topCenter,
                      ),
                      const SizedBox(height: Insets.sm),
                      Text(
                        label.tr(),
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Material(
              type: MaterialType.transparency,
              borderRadius: BorderRadius.circular(400),
              child: Center(
                child: Transform.translate(
                  offset: const Offset(0.0, -12.0),
                  child: Transform.scale(
                    scale: 1.5,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(200),
                      onTap: () => toolsController.showTool(toolType),
                      child: const SizedBox(height: 40, width: 40),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
