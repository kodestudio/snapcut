// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tune_filter_tool.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TuneFilterToolAdapter extends TypeAdapter<TuneFilterTool> {
  @override
  final int typeId = 8;

  @override
  TuneFilterTool read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TuneFilterTool(
      fields[1] as TuneType,
      fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TuneFilterTool obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TuneFilterToolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
