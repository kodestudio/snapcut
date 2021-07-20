import 'package:flutter/material.dart';
import 'package:snapcut/src/models/filter_tool/tool_type.dart';
import 'package:easy_localization/easy_localization.dart';

class ToolGridTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Center(
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
              const SizedBox(height: 10),
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
    );
  }
}
