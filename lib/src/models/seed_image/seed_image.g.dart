// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeedImageAdapter extends TypeAdapter<SeedImage> {
  @override
  final int typeId = 0;

  @override
  SeedImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeedImage()
      ..bytes = fields[0] as Uint8List?
      ..path = fields[1] as String?
      ..filterToolTypes = (fields[2] as List).cast<FilterToolType>();
  }

  @override
  void write(BinaryWriter writer, SeedImage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bytes)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.filterToolTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeedImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
