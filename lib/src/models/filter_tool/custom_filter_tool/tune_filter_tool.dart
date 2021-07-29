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
        // Biến đổi gamma
        return Stack(
          children: [
            child,
            value > 0
                ? Opacity(
                    opacity: value / 100 * 0.7,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.linearToSrgbGamma(),
                      child: child,
                    ),
                  )
                : Opacity(
                    opacity: -value / 100 * 0.7,
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.srgbToLinearGamma(),
                      child: child,
                    ),
                  ),
          ],
        );
      case TuneType.hightlights:
        return Container(
          foregroundDecoration: BoxDecoration(
            color: value > 0 ? Colors.amber.withOpacity(value / 300) : Colors.black.withOpacity(-value / 300),
            backgroundBlendMode: BlendMode.hue,
          ),
          clipBehavior: Clip.none,
          child: child,
        );
      case TuneType.shadows:
        return ColorFiltered(
          colorFilter: ImageProcessor.shadows(value),
          child: child,
        );
      case TuneType.warmth:
        return ColorFiltered(
          colorFilter: ImageProcessor.warmth(value),
          child: child,
        );
    }
  }
}
