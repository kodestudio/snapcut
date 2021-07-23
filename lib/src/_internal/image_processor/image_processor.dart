import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ImageProcessor {
  static ColorFilter brightness(int value) {
    var m = List<double>.from(defaultColorMatrix);
    m[4] = value / 100 * 150;
    m[9] = value / 100 * 150;
    m[14] = value / 100 * 150;

    return ColorFilter.matrix(m);
  }

  static ColorFilter contrast(int value) {
    final contrast = value / 100;
    final m = List<double>.from(defaultColorMatrix);

    m[0] = 1 + contrast * 0.5;
    m[6] = 1 + contrast * 0.5;
    m[12] = 1 + contrast * 0.5;

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
}

const defaultColorMatrix = <double>[1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
