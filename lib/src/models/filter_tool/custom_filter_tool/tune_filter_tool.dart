import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:snapcut/src/_internal/image_processor/image_processor.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool.dart';
import 'package:snapcut/src/models/image_editor/tools/1.tune/tune_type.dart';
import 'package:snapcut/src/utils/hive_id.dart';

part 'tune_filter_tool.g.dart';

@HiveType(typeId: HiveId.tuneTypeFilterTool)
class TuneFilterTool implements FilterTool {
  @HiveField(0)
  final int value;
  @HiveField(1)
  final TuneType type;

  const TuneFilterTool(this.type, this.value);

  List<double> calculateContrastMatrix(double contrast) {
    final m = List<double>.from(defaultColorMatrix);

    m[0] = 1 + contrast * 0.5;
    m[6] = 1 + contrast * 0.5;
    m[12] = 1 + contrast * 0.5;
    return m;
  }

  List<double> calculateSaturationMatrix(double saturation) {
    final m = List<double>.from(defaultColorMatrix);
    final invSat = 1 - saturation;
    final R = 0.3086 * invSat;
    final G = 0.6094 * invSat;
    final B = 0.0820 * invSat;

    m[0] = R + saturation;
    m[1] = G;
    m[2] = B;
    m[5] = R;
    m[6] = G + saturation;
    m[7] = B;
    m[10] = R;
    m[11] = G;
    m[12] = B + saturation;

    return m;
  }

  @override
  Widget filter(Widget child) {
    // TuneType.brightness
    // TuneType.contrast
    // TuneType.saturation
    // TuneType.ambiance
    // TuneType.hightlights
    // TuneType.shadows
    // TuneType.warmth

    switch (type) {
      case TuneType.brightness:
        return ColorFiltered(
          colorFilter: ImageProcessor.brightness(value),
          child: child,
        );
      case TuneType.contrast:
        return ColorFiltered(
          colorFilter: ImageProcessor.contrast(value),
          child: child,
        );
      case TuneType.saturation:
        return ColorFiltered(
          colorFilter: ImageProcessor.saturation(value),
          child: child,
        );
      case TuneType.ambiance:
        return ImageFiltered(
          imageFilter: ImageProcessor.ambition(value),
          child: child,
        );
      case TuneType.hightlights:
        return ImageFiltered(
          imageFilter: ImageProcessor.hightlights(value),
          child: child,
        );
      case TuneType.shadows:
        return ImageFiltered(
          imageFilter: ImageProcessor.shadows(value),
          child: child,
        );
      case TuneType.warmth:
        return ImageFiltered(
          imageFilter: ImageProcessor.warmth(value),
          child: child,
        );

      default:
        return child;
    }
  }
}
