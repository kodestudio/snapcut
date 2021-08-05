import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:snapcut/src/models/filter_tool/filter_tool.dart';
import 'package:snapcut/src/utils/hive_id.dart';

part 'rotate_filter_tool.g.dart';

@HiveType(typeId: HiveId.rotateFilterTool)
class RotateFilterTool implements FilterTool {
  @HiveField(0)
  final double angle;
  @HiveField(1)
  final bool flipped;

  RotateFilterTool({
    required this.angle,
    required this.flipped,
  });

  @override
  FutureOr<Widget> filter(Widget child) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(math.pi),
      child: Transform.rotate(
        angle: angle,
        child: child,
      ),
    );
  }
}
