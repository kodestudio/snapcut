import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool.dart';
import 'package:snapcut/src/utils/hive_id.dart';

part 'brush_filter_tool.g.dart';

@HiveType(typeId: HiveId.brushFilterTool)
class BrushFilterTool extends FilterTool {
  @HiveField(0)
  final BrushType brushType;
  @HiveField(1)
  final List<BrushPoint> points;

  BrushFilterTool({
    required this.brushType,
    required this.points,
  });

  // TODO: implement brush filter
  @override
  Widget filter(Widget child) {
    switch (brushType) {
      case BrushType.dodgeAndBurn:
        return CustomPaint(
          foregroundPainter: BrushPainter(brushType: brushType, points: points),
          child: child,
        );
      case BrushType.exposure:
        return child;
      case BrushType.temperature:
        return child;
      case BrushType.saturation:
        return child;
    }
  }

  BrushFilterTool addPoint(BrushPoint point) => BrushFilterTool(
        brushType: brushType,
        points: [...points, point],
      );
  BrushFilterTool addPoints(List<BrushPoint> newPoints) => BrushFilterTool(
        brushType: brushType,
        points: [...points, ...newPoints],
      );
}

@HiveType(typeId: HiveId.brushPoint)
class BrushPoint {
  @HiveField(0)
  final Point point;
  @HiveField(1)
  final BrushLevel level;

  void draw(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..blendMode = BlendMode.colorDodge;
    canvas.drawCircle(point.toOffset(size), 20, paint);
  }

  const BrushPoint(this.point, this.level);
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
  BrushPoint toPoint(BrushLevel level) => BrushPoint(Point(dx, dy), level);
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
    required this.points,
  });

  final BrushType brushType;
  final List<BrushPoint> points;

  @override
  void paint(Canvas canvas, Size size) {
    // FIX: Poor performance fix this
    for (var point in points) {
      point.draw(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
