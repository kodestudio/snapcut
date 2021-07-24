import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImageProcessor {
  static ColorFilter brightness(int value) {
    var m = List<double>.from(defaultColorMatrix);
    if (kIsWeb) {
      m[4] = value / 100 * 0.18;
      m[9] = value / 100 * 0.18;
      m[14] = value / 100 * 0.18;
    } else {
      m[4] = value / 100 * 50;
      m[9] = value / 100 * 50;
      m[14] = value / 100 * 50;
    }
    return ColorFilter.matrix(m);
  }

  static ColorFilter contrast(int value) {
    final contrast = value / 100;
    final m = List<double>.from(defaultColorMatrix);

    if (kIsWeb) {
      if (contrast < 0) {
        m[0] = 1 + contrast * 0.65;
        m[6] = 1 + contrast * 0.65;
        m[12] = 1 + contrast * 0.65;
      } else {
        m[0] = 1 + contrast * 0.65;
        m[6] = 1 + contrast * 0.65;
        m[12] = 1 + contrast * 0.65;
      }
    } else {
      if (contrast < 0) {
        m[0] = 1 + contrast * 0.65;
        m[6] = 1 + contrast * 0.65;
        m[12] = 1 + contrast * 0.65;
      } else {
        m[0] = 1 + contrast * 0.75;
        m[6] = 1 + contrast * 0.75;
        m[12] = 1 + contrast * 0.75;
      }
    }

    return ColorFilter.matrix(m);
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

  // TODO: missing implement filter
  static ColorFilter ambition(int value) {
    return const ColorFilter.matrix(defaultColorMatrix);
  }

  // TODO: missing implement filter
  static ColorFilter hightlights(int value) => const ColorFilter.matrix(defaultColorMatrix);

  // TODO: missing implement filter
  static ColorFilter shadows(int value) => const ColorFilter.matrix(defaultColorMatrix);

  // TODO: missing implement filter
  static ColorFilter warmth(int value) => const ColorFilter.matrix(defaultColorMatrix);
}

const defaultColorMatrix = <double>[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
