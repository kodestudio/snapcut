// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tune_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TuneTypeAdapter extends TypeAdapter<TuneType> {
  @override
  final int typeId = 9;

  @override
  TuneType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TuneType.brightness;
      case 1:
        return TuneType.contrast;
      case 2:
        return TuneType.saturation;
      case 3:
        return TuneType.ambiance;
      case 4:
        return TuneType.hightlights;
      case 5:
        return TuneType.shadows;
      case 6:
        return TuneType.warmth;
      default:
        return TuneType.brightness;
    }
  }

  @override
  void write(BinaryWriter writer, TuneType obj) {
    switch (obj) {
      case TuneType.brightness:
        writer.writeByte(0);
        break;
      case TuneType.contrast:
        writer.writeByte(1);
        break;
      case TuneType.saturation:
        writer.writeByte(2);
        break;
      case TuneType.ambiance:
        writer.writeByte(3);
        break;
      case TuneType.hightlights:
        writer.writeByte(4);
        break;
      case TuneType.shadows:
        writer.writeByte(5);
        break;
      case TuneType.warmth:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TuneTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
