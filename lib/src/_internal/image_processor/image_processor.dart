import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImageProcessor {
  static ColorFilter brightness(int value) => ColorFilter.mode(
        value > 0 ? Colors.white.withOpacity(value / 100) : Colors.black.withOpacity(-value / 150),
        value > 0 ? BlendMode.softLight : BlendMode.colorBurn,
      );

  static ColorFilter contrast(int value) {
    final contrast = value / 100;
    final m = List<double>.from(defaultColorMatrix);

    m[0] = 1 + contrast * 0.5;
    m[6] = 1 + contrast * 0.5;
    m[12] = 1 + contrast * 0.5;

    return ColorFilter.matrix(m);
  }

  static ColorFilter saturation(int value) {
    final saturation = value / 100;

    final m = List<double>.from(defaultColorMatrix);
    final invSat = 1 - saturation;
    final R = 0.3086 * invSat;
    final G = 0.6094 * invSat;
    final B = 0.0820 * invSat;

    m[0] = R + saturation;
    m[1] = G;
    m[2] = B;
    m[5] = R;
    m[6] = G + saturation;
    m[7] = B;
    m[10] = R;
    m[11] = G;
    m[12] = B + saturation;

    return ColorFilter.matrix(m);
  }
}

const defaultColorMatrix = <double>[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
