// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_filter_tool.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ColorFilterToolAdapter extends TypeAdapter<ColorFilterTool> {
  @override
  final int typeId = 3;

  @override
  ColorFilterTool read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ColorFilterTool(
      fields[0] as String,
      fields[1] as BlendMode,
    );
  }

  @override
  void write(BinaryWriter writer, ColorFilterTool obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.blendMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorFilterToolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
