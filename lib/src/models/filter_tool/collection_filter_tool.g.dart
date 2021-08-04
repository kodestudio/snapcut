// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_filter_tool.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollectionFilterToolAdapter extends TypeAdapter<CollectionFilterTool> {
  @override
  final int typeId = 5;

  @override
  CollectionFilterTool read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollectionFilterTool(
      fields[0] as ToolType,
      (fields[1] as List).cast<FilterTool>(),
    );
  }

  @override
  void write(BinaryWriter writer, CollectionFilterTool obj) {
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
      other is CollectionFilterToolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
