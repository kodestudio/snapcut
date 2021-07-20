import 'package:flutter/painting.dart';
import 'package:hive/hive.dart';
import 'package:snapseed/src/utils/db_id.dart';

class BlendModeAdapter extends TypeAdapter<BlendMode> {
  @override
  final int typeId = HiveId.blendMode;

  @override
  BlendMode read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BlendMode.clear;
      case 1:
        return BlendMode.src;
      case 2:
        return BlendMode.dst;
      case 3:
        return BlendMode.srcOver;
      case 4:
        return BlendMode.dstOver;
      case 5:
        return BlendMode.srcIn;
      case 6:
        return BlendMode.dstIn;
      case 7:
        return BlendMode.srcOut;
      case 8:
        return BlendMode.dstOut;
      case 9:
        return BlendMode.srcATop;
      case 10:
        return BlendMode.dstATop;
      case 11:
        return BlendMode.xor;
      case 12:
        return BlendMode.plus;
      case 13:
        return BlendMode.modulate;
      case 14:
        return BlendMode.screen;
      case 15:
        return BlendMode.overlay;
      case 16:
        return BlendMode.darken;
      case 17:
        return BlendMode.lighten;
      case 18:
        return BlendMode.colorDodge;
      case 19:
        return BlendMode.colorBurn;
      case 20:
        return BlendMode.hardLight;
      case 21:
        return BlendMode.softLight;
      case 22:
        return BlendMode.difference;
      case 23:
        return BlendMode.exclusion;
      case 24:
        return BlendMode.multiply;
      case 25:
        return BlendMode.hue;
      case 26:
        return BlendMode.saturation;
      case 27:
        return BlendMode.color;
      case 28:
        return BlendMode.luminosity;
      default:
        return BlendMode.clear;
    }
  }

  @override
  void write(BinaryWriter writer, BlendMode obj) {
    switch (obj) {
      case BlendMode.clear:
        writer.writeByte(0);
        break;
      case BlendMode.src:
        writer.writeByte(1);
        break;
      case BlendMode.dst:
        writer.writeByte(2);
        break;
      case BlendMode.srcOver:
        writer.writeByte(3);
        break;
      case BlendMode.dstOver:
        writer.writeByte(4);
        break;
      case BlendMode.srcIn:
        writer.writeByte(5);
        break;
      case BlendMode.dstIn:
        writer.writeByte(6);
        break;
      case BlendMode.srcOut:
        writer.writeByte(7);
        break;
      case BlendMode.dstOut:
        writer.writeByte(8);
        break;
      case BlendMode.srcATop:
        writer.writeByte(9);
        break;
      case BlendMode.dstATop:
        writer.writeByte(10);
        break;
      case BlendMode.xor:
        writer.writeByte(11);
        break;
      case BlendMode.plus:
        writer.writeByte(12);
        break;
      case BlendMode.modulate:
        writer.writeByte(13);
        break;
      case BlendMode.screen:
        writer.writeByte(14);
        break;
      case BlendMode.overlay:
        writer.writeByte(15);
        break;
      case BlendMode.darken:
        writer.writeByte(16);
        break;
      case BlendMode.lighten:
        writer.writeByte(17);
        break;
      case BlendMode.colorDodge:
        writer.writeByte(18);
        break;
      case BlendMode.colorBurn:
        writer.writeByte(19);
        break;
      case BlendMode.hardLight:
        writer.writeByte(20);
        break;
      case BlendMode.softLight:
        writer.writeByte(21);
        break;
      case BlendMode.difference:
        writer.writeByte(22);
        break;
      case BlendMode.exclusion:
        writer.writeByte(23);
        break;
      case BlendMode.multiply:
        writer.writeByte(24);
        break;
      case BlendMode.hue:
        writer.writeByte(25);
        break;
      case BlendMode.saturation:
        writer.writeByte(26);
        break;
      case BlendMode.color:
        writer.writeByte(27);
        break;
      case BlendMode.luminosity:
        writer.writeByte(28);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BlendModeAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
