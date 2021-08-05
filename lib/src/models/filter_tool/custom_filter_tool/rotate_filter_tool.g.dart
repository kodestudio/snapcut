// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rotate_filter_tool.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RotateFilterToolAdapter extends TypeAdapter<RotateFilterTool> {
  @override
  final int typeId = 11;

  @override
  RotateFilterTool read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RotateFilterTool(
      angle: fields[0] as double,
      flipped: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RotateFilterTool obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.angle)
      ..writeByte(1)
      ..write(obj.flipped);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RotateFilterToolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
