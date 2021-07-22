import 'package:flutter/material.dart';

extension AppColorX on ColorScheme {
  Color get progressBar => (brightness == Brightness.light ? const Color(0xFFf9f9f9) : const Color(0xFF2e2e32)).withOpacity(0.8);
  Color get progressBarIndicator => (brightness == Brightness.light ? const Color(0xFFbdc1c6) : const Color(0xFF676767)).withOpacity(0.4);
}
