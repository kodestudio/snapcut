import 'package:flutter/material.dart';

class Globals {
  static GlobalKey<NavigatorState> appNav = GlobalKey();
  static GlobalKey<NavigatorState> bodyNav = GlobalKey();
  static GlobalKey<NavigatorState> bottomNav = GlobalKey();
}

extension NavKeyX on GlobalKey<NavigatorState> {
  BuildContext get context => currentState!.context;
}
