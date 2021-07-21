import 'package:flutter/material.dart';

class SnapcutRouter {
  static Future<T?> push<T extends Object?>(BuildContext context, Widget page) async {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }
}
