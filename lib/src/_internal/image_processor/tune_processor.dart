import 'dart:typed_data';

import 'package:image/image.dart' as imglib;

class TuneProcessor {
  static Future<Uint8List> brightness(
    Uint8List bytes,
    int value,
  ) async {
    imglib.Image? img = imglib.decodeImage(bytes);
    img = imglib.brightness(img, value);
    if (img != null) {
      return Uint8List.fromList(imglib.encodePng(img));
    } else {
      return bytes;
    }
  }
}
