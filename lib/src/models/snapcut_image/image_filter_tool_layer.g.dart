// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_filter_tool_layer.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageFilterToolLayerAdapter extends TypeAdapter<ImageFilterToolLayer> {
  @override
  final int typeId = 10;

  @override
  ImageFilterToolLayer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageFilterToolLayer(
      front: (fields[0] as List).cast<CollectionFilterTool>(),
      middle: (fields[1] as List).cast<CollectionFilterTool>(),
      back: (fields[2] as List).cast<CollectionFilterTool>(),
    );
  }

  @override
  void write(BinaryWriter writer, ImageFilterToolLayer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.front)
      ..writeByte(1)
      ..write(obj.middle)
      ..writeByte(2)
      ..write(obj.back);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageFilterToolLayerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
