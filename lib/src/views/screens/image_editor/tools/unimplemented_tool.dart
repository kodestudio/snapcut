import 'package:flutter/material.dart';
import 'package:snapcut/src/models/filter_tool/tool_type.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:snapcut/src/utils/styles.dart';

class UnimplementedTool extends StatelessWidget {
  const UnimplementedTool(this.toolType, {Key? key}) : super(key: key);

  final ToolType toolType;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Padding(
          padding: const EdgeInsets.all(Insets.m),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'utils.caution'.tr(),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: Insets.sm),
              Text('imageEditor.tools.unimplemented'.tr(args: [toolType.path.tr().toLowerCase()]), textAlign: TextAlign.center),
              const SizedBox(height: Insets.l),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('utils.ok'.tr()),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
