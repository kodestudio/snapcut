// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brush_filter_tool.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrushLevelAdapter extends TypeAdapter<BrushLevel> {
  @override
  final int typeId = 15;

  @override
  BrushLevel read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BrushLevel.negativeLevel2;
      case 1:
        return BrushLevel.negativeLevel1;
      case 2:
        return BrushLevel.remove;
      case 3:
        return BrushLevel.level1;
      case 4:
        return BrushLevel.level2;
      default:
        return BrushLevel.negativeLevel2;
    }
  }

  @override
  void write(BinaryWriter writer, BrushLevel obj) {
    switch (obj) {
      case BrushLevel.negativeLevel2:
        writer.writeByte(0);
        break;
      case BrushLevel.negativeLevel1:
        writer.writeByte(1);
        break;
      case BrushLevel.remove:
        writer.writeByte(2);
        break;
      case BrushLevel.level1:
        writer.writeByte(3);
        break;
      case BrushLevel.level2:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrushLevelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrushTypeAdapter extends TypeAdapter<BrushType> {
  @override
  final int typeId = 16;

  @override
  BrushType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BrushType.dodgeAndBurn;
      case 1:
        return BrushType.exposure;
      case 2:
        return BrushType.temperature;
      case 3:
        return BrushType.saturation;
      default:
        return BrushType.dodgeAndBurn;
    }
  }

  @override
  void write(BinaryWriter writer, BrushType obj) {
    switch (obj) {
      case BrushType.dodgeAndBurn:
        writer.writeByte(0);
        break;
      case BrushType.exposure:
        writer.writeByte(1);
        break;
      case BrushType.temperature:
        writer.writeByte(2);
        break;
      case BrushType.saturation:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrushTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrushFilterToolAdapter extends TypeAdapter<BrushFilterTool> {
  @override
  final int typeId = 12;

  @override
  BrushFilterTool read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrushFilterTool(
      brushType: fields[0] as BrushType,
      points: (fields[1] as List).cast<BrushPoint>(),
    );
  }

  @override
  void write(BinaryWriter writer, BrushFilterTool obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.brushType)
      ..writeByte(1)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrushFilterToolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrushPointAdapter extends TypeAdapter<BrushPoint> {
  @override
  final int typeId = 13;

  @override
  BrushPoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrushPoint(
      fields[0] as Point,
      fields[1] as BrushLevel,
    );
  }

  @override
  void write(BinaryWriter writer, BrushPoint obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.point)
      ..writeByte(1)
      ..write(obj.level);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrushPointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PointAdapter extends TypeAdapter<Point> {
  @override
  final int typeId = 14;

  @override
  Point read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Point(
      fields[0] as double,
      fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Point obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dx)
      ..writeByte(1)
      ..write(obj.dy);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
