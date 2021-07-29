import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// BlendMode flutter web don't support:
/// [BlendMode.overlay]

class ImageProcessor {
  static ColorFilter brightness(int value) {
    if (kIsWeb) {
      var m = List<double>.from(defaultColorMatrix);
      if (value > 0) {
        m[4] = value / 100 * 0.1;
        m[9] = value / 100 * 0.1;
        m[14] = value / 100 * 0.1;
      } else {
        m[4] = value / 100 * 0.18;
        m[9] = value / 100 * 0.18;
        m[14] = value / 100 * 0.18;
      }
      return ColorFilter.matrix(m);
    }

    return ColorFilter.mode(
      value > 0 ? const Color(0xFFEEEEEE).withOpacity(value / 110) : Colors.black12.withOpacity(-value / 150),
      value > 0 ? BlendMode.overlay : BlendMode.srcATop,
    );
  }

  static ColorFilter contrast(int value) {
    final contrast = value / 250;

    double scale = contrast + 1.0;
    double translate = (-.5 * scale + .5) * 255.0;

    return ColorFilter.matrix([scale, 0, 0, 0, translate, 0, scale, 0, 0, translate, 0, 0, scale, 0, translate, 0, 0, 0, 1, 0]);
  }

  static ColorFilter saturation(int value) {
    // if (value == 0) return const ColorFilter.matrix(defaultColorMatrix);
    final sat = (value + 100) / 100;

    List<double> m = List.from(defaultColorMatrix);

    double invSat = 1 - sat; //<---------invSat will be negative if sat bigger than 1
    double R = 0.213 * invSat;
    double G = 0.715 * invSat;
    double B = 0.072 * invSat;

    m[0] = R + sat;
    m[1] = G;
    m[2] = B;
    m[5] = R;
    m[6] = G + sat;
    m[7] = B;
    m[10] = R;
    m[11] = G;
    m[12] = B + sat;

    return ColorFilter.matrix(m);
  }

  // Must implement in widget level
  static ColorFilter ambition(int value) => const ColorFilter.matrix(defaultColorMatrix);

  // TODO: missing implement filter
  static ColorFilter hightlights(int value) => const ColorFilter.matrix(defaultColorMatrix);

  // TODO: missing implement filter
  static ColorFilter shadows(int value) => const ColorFilter.matrix(defaultColorMatrix);

  static ColorFilter warmth(int value) => ColorFilter.matrix([
        <double>[1, 0, 0, 0, 60 * value / 200],
        <double>[0, 1, 0, 0, 45 * value / 200],
        <double>[0, 0, 1, 0, -20 * value / 200],
        <double>[0, 0, 0, 1, 0]
      ].expand((e) => e).toList());
}

const defaultColorMatrix = <double>[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
