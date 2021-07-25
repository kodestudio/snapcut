// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Durations {
  static const Duration fastest = Duration(milliseconds: 150);

  static const Duration fast = Duration(milliseconds: 250);

  static const Duration medium = Duration(milliseconds: 350);

  static const Duration slow = Duration(milliseconds: 700);
}

class PageBreaks {
  static double get largePhone => 550;

  static double get tabletPortrait => 768;

  static double get tabletLandscape => 1024;

  static double get desktop => 1440;
}

extension AppSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}

extension Responsive on Size {
  bool get isSmallPhone => width < PageBreaks.largePhone;
  bool get isBiggerSmallPhone => width >= PageBreaks.largePhone;

  bool get isLargePhone => width >= PageBreaks.largePhone && width < PageBreaks.tabletPortrait;
  bool get isBiggerLargePhone => width >= PageBreaks.tabletPortrait;

  bool get isTabletPortrait => width >= PageBreaks.tabletPortrait && width < PageBreaks.tabletLandscape;
  bool get isBiggerTabletPortrait => width >= PageBreaks.tabletLandscape;

  bool get isTabletLandscape => width >= PageBreaks.tabletLandscape && width < PageBreaks.desktop;

  /// Same as isDesktop
  bool get isBiggerTabletLandscape => width >= PageBreaks.desktop;

  bool get isDesktop => width >= PageBreaks.desktop;
}

class Insets {
  static double gutterScale = 1;

  static const double scale = 1;

  /// Dynamic insets, may get scaled with the device size
  static double mGutter = m * gutterScale;

  static double lGutter = l * gutterScale;

  static const double xs = 2 * scale;

  static const double sm = 6 * scale;

  static const double m = 12 * scale;

  static const double l = 24 * scale;

  static const double xl = 36 * scale;
}

class Sizes {
  static const double hitScale = 1;

  static const double hit = 40 * hitScale;

  static const double iconMed = 20;

  static const double sideBarSm = 150 * hitScale;

  static const double sideBarMed = 200 * hitScale;

  static const double sideBarLg = 290 * hitScale;
}
