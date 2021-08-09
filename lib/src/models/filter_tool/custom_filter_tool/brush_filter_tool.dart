import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snapcut/src/_internal/image_processor/image_processor.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool.dart';
import 'package:snapcut/src/utils/hive_id.dart';

part 'brush_filter_tool.g.dart';

@HiveType(typeId: HiveId.brushFilterTool)
class BrushFilterTool extends FilterTool {
  @HiveField(0)
  final BrushType brushType;
  @HiveField(1)
  final List<BrushPoints> points;

  BrushFilterTool({
    required this.brushType,
    required this.points,
  });

  // TODO: implement brush filter
  @override
  Widget filter(Widget child) {
    switch (brushType) {
      case BrushType.dodgeAndBurn:
        return Stack(
          children: [
            ColorFiltered(
              colorFilter: ImageProcessor.warmth(40),
              child: child,
            ),
            ClipPath(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: CustomPaint(
                isComplex: true,
                foregroundPainter: BrushPainter(brushType: brushType, pointsList: points),
                child: child,
              ),
            ),
          ],
        );
      case BrushType.exposure:
        return child;
      case BrushType.temperature:
        return child;
      case BrushType.saturation:
        return child;
    }
  }

  BrushFilterTool addPoint(BrushPoints point) => BrushFilterTool(
        brushType: brushType,
        points: [...points, point],
      );
  BrushFilterTool addPoints(List<BrushPoints> newPoints) => BrushFilterTool(
        brushType: brushType,
        points: [...points, ...newPoints],
      );
}

@HiveType(typeId: HiveId.brushPoints)
class BrushPoints {
  @HiveField(0)
  final List<Point> points;
  @HiveField(1)
  final BrushLevel level;

  void draw(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = _brushLevelColors[level.index]
      ..blendMode = BlendMode.clear
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 11;

    var offsets = points.map<Offset>((p) => Offset(p.dx * size.width, p.dy * size.height)).toList();
    canvas.drawPoints(PointMode.polygon, offsets, paint);
  }

  const BrushPoints(this.points, this.level);
}

@HiveType(typeId: HiveId.point)
class Point {
  @HiveField(0)
  final double dx;
  @HiveField(1)
  final double dy;

  const Point(this.dx, this.dy);

  Offset toOffset(Size size) => Offset(dx * size.width, dy * size.height);
}

extension PointX on Offset {
  Point toPoint() => Point(dx, dy);
}

@HiveType(typeId: HiveId.brushLevel)
enum BrushLevel {
  @HiveField(0)
  negativeLevel2,
  @HiveField(1)
  negativeLevel1,
  @HiveField(2)
  remove,
  @HiveField(3)
  level1,
  @HiveField(4)
  level2,
}

List<Color> _brushLevelColors = [
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.blue,
  Colors.cyan,
];

@HiveType(typeId: HiveId.brushType)
enum BrushType {
  @HiveField(0)
  dodgeAndBurn,
  @HiveField(1)
  exposure,
  @HiveField(2)
  temperature,
  @HiveField(3)
  saturation,
}

class BrushPainter extends CustomPainter {
  const BrushPainter({
    required this.brushType,
    required this.pointsList,
  });

  final BrushType brushType;
  final List<BrushPoints> pointsList;

  @override
  void paint(Canvas canvas, Size size) {
    for (var points in pointsList) {
      points.draw(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
