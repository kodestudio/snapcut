import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:snapcut/src/_internal/hex_color.dart';
import 'package:snapcut/src/utils/db_id.dart';

import '../filter_tool.dart';

part 'color_filter_tool.g.dart';

@HiveType(typeId: HiveId.colorFilterTool)
class ColorFilterTool implements FilterTool {
  @HiveField(0)
  final String color;
  @HiveField(1)
  final BlendMode blendMode;

  ColorFilterTool(this.color, this.blendMode);

  @override
  Widget filter(Widget child) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(HexColor.fromHex(color), blendMode),
      child: child,
    );
  }
}
