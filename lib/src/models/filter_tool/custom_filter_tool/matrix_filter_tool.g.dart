// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_filter_tool.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatrixFilterToolAdapter extends TypeAdapter<MatrixFilterTool> {
  @override
  final int typeId = 4;

  @override
  MatrixFilterTool read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatrixFilterTool(
      (fields[0] as List)
          .map((dynamic e) => (e as List).cast<double>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, MatrixFilterTool obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.matrix);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatrixFilterToolAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
