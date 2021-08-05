import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:snapcut/src/models/filter_tool/filter_tool.dart';
import 'package:snapcut/src/utils/hive_id.dart';
import 'package:snapcut/src/utils/utils.dart';

part 'rotate_filter_tool.g.dart';

@HiveType(typeId: HiveId.rotateFilterTool)
class RotateFilterTool implements FilterTool {
  @HiveField(0)
  final int quarterTurns;
  @HiveField(1)
  final bool horizontalFlipped;
  @HiveField(2)
  final bool verticalFlipped;

  RotateFilterTool({
    required this.quarterTurns,
    required this.horizontalFlipped,
    required this.verticalFlipped,
  });

  @override
  FutureOr<Widget> filter(Widget child) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: TweenAnimationBuilder<double>(
        duration: Durations.fast,
        tween: Tween<double>(begin: 0.0, end: horizontalFlipped ? 1.0 : 0.0),
        builder: (context, value, horizontalTween) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(value * math.pi),
          child: horizontalTween,
        ),
        child: TweenAnimationBuilder<double>(
          duration: Durations.fast,
          tween: Tween<double>(begin: 0.0, end: verticalFlipped ? 1.0 : 0.0),
          builder: (context, value, _) => Transform(alignment: Alignment.center, transform: Matrix4.rotationX(value * math.pi), child: child),
        ),
      ),
    );
  }
}
