import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    m[0] = contrast;
    m[6] = contrast;
    m[12] = contrast;
    return m;
  }

  List<double> calculateSaturationMatrix(double saturation) {
    final m = List<double>.from(defaultColorMatrix);
    final invSat = 1 - saturation;
    final R = 0.213 * invSat;
    final G = 0.715 * invSat;
    final B = 0.072 * invSat;

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
    switch (type) {
      case TuneType.brightness:
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            value > 0 ? Colors.white.withOpacity(value / 400) : Colors.black.withOpacity(-value / 150),
            value > 0 ? BlendMode.lighten : BlendMode.darken,
          ),
          child: child,
        );
      case TuneType.contrast:
        return ColorFiltered(
          colorFilter: ColorFilter.matrix(calculateContrastMatrix(value / 100)),
          child: child,
        );
      case TuneType.saturation:
        return ColorFiltered(
          colorFilter: ColorFilter.matrix(calculateSaturationMatrix(value / 100)),
          child: child,
        );
      default:
        return child;
    }
  }
}

extension ListTuneFilterX on List<FilterTool> {
  bool containTuneFilter(TuneType type) {
    bool res = false;
    for (var filter in this) {
      if (filter is TuneFilterTool) {
        res = filter.type == type;
      }
    }
    return res;
  }
}

const defaultColorMatrix = <double>[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
