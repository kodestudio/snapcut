// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToolTypeAdapter extends TypeAdapter<ToolType> {
  @override
  final int typeId = 6;

  @override
  ToolType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ToolType.tune;
      case 1:
        return ToolType.details;
      case 2:
        return ToolType.curves;
      case 3:
        return ToolType.whiteBalance;
      case 4:
        return ToolType.crop;
      case 5:
        return ToolType.rotate;
      case 6:
        return ToolType.perspective;
      case 7:
        return ToolType.expand;
      case 8:
        return ToolType.selective;
      case 9:
        return ToolType.brush;
      case 10:
        return ToolType.healing;
      case 11:
        return ToolType.hdr;
      case 12:
        return ToolType.glamourGlow;
      case 13:
        return ToolType.tonalContrast;
      case 14:
        return ToolType.drama;
      case 15:
        return ToolType.vintage;
      case 16:
        return ToolType.grainyFilms;
      case 17:
        return ToolType.retrolux;
      case 18:
        return ToolType.grunge;
      case 19:
        return ToolType.blackAndWhite;
      case 20:
        return ToolType.noir;
      case 21:
        return ToolType.portrait;
      case 22:
        return ToolType.headPose;
      case 23:
        return ToolType.lensBlur;
      case 24:
        return ToolType.vignette;
      case 25:
        return ToolType.doubleExposure;
      case 26:
        return ToolType.text;
      case 27:
        return ToolType.frames;
      default:
        return ToolType.tune;
    }
  }

  @override
  void write(BinaryWriter writer, ToolType obj) {
    switch (obj) {
      case ToolType.tune:
        writer.writeByte(0);
        break;
      case ToolType.details:
        writer.writeByte(1);
        break;
      case ToolType.curves:
        writer.writeByte(2);
        break;
      case ToolType.whiteBalance:
        writer.writeByte(3);
        break;
      case ToolType.crop:
        writer.writeByte(4);
        break;
      case ToolType.rotate:
        writer.writeByte(5);
        break;
      case ToolType.perspective:
        writer.writeByte(6);
        break;
      case ToolType.expand:
        writer.writeByte(7);
        break;
      case ToolType.selective:
        writer.writeByte(8);
        break;
      case ToolType.brush:
        writer.writeByte(9);
        break;
      case ToolType.healing:
        writer.writeByte(10);
        break;
      case ToolType.hdr:
        writer.writeByte(11);
        break;
      case ToolType.glamourGlow:
        writer.writeByte(12);
        break;
      case ToolType.tonalContrast:
        writer.writeByte(13);
        break;
      case ToolType.drama:
        writer.writeByte(14);
        break;
      case ToolType.vintage:
        writer.writeByte(15);
        break;
      case ToolType.grainyFilms:
        writer.writeByte(16);
        break;
      case ToolType.retrolux:
        writer.writeByte(17);
        break;
      case ToolType.grunge:
        writer.writeByte(18);
        break;
      case ToolType.blackAndWhite:
        writer.writeByte(19);
        break;
      case ToolType.noir:
        writer.writeByte(20);
        break;
      case ToolType.portrait:
        writer.writeByte(21);
        break;
      case ToolType.headPose:
        writer.writeByte(22);
        break;
      case ToolType.lensBlur:
        writer.writeByte(23);
        break;
      case ToolType.vignette:
        writer.writeByte(24);
        break;
      case ToolType.doubleExposure:
        writer.writeByte(25);
        break;
      case ToolType.text:
        writer.writeByte(26);
        break;
      case ToolType.frames:
        writer.writeByte(27);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToolTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
