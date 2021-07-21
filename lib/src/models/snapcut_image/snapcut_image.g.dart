// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snapcut_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SnapcutImageAdapter extends TypeAdapter<SnapcutImage> {
  @override
  final int typeId = 0;

  @override
  SnapcutImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SnapcutImage()
      ..bytes = fields[0] as Uint8List?
      ..path = fields[1] as String?
      ..filterToolTypes = (fields[2] as List).cast<FilterToolType>();
  }

  @override
  void write(BinaryWriter writer, SnapcutImage obj) {
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
  bool operator ==(Object other) => identical(this, other) || other is SnapcutImageAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
