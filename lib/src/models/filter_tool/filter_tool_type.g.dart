// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_tool_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilterToolTypeAdapter extends TypeAdapter<FilterToolType> {
  @override
  final int typeId = 5;

  @override
  FilterToolType read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilterToolType(
      fields[0] as ToolType,
      (fields[1] as List).cast<FilterTool>(),
    );
  }

  @override
  void write(BinaryWriter writer, FilterToolType obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.filterToolList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterToolTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
