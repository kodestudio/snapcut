import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingsControllerProvider = ChangeNotifierProvider((ref) => SettingsController());

class SettingsController extends ChangeNotifier {
  bool isDark = true;

  ThemeData get theme => (isDark ? ThemeData.dark() : ThemeData.light()).copyWith(
        colorScheme: (isDark ? const ColorScheme.dark() : const ColorScheme.light()).copyWith(
          primary: const Color(0xFF6194D5),
          background: isDark ? const Color(0xFF202124) : const Color(0xFFe0e0e0),
          onBackground: isDark ? const Color(0xFFbdc1c6) : const Color(0xFF676767),
        ),
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.openSansTextTheme().apply(
            bodyColor: isDark ? Colors.white : Colors.black,
          ),
          iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black, size: 20),
          elevation: 3.0,
          color: isDark ? const Color(0xFF2d2d30) : Colors.white,
        ),
        textTheme: GoogleFonts.openSansTextTheme().apply(
          bodyColor: isDark ? const Color(0xFFbdc1c6) : const Color(0xFF676767),
        ),
        scaffoldBackgroundColor: isDark ? const Color(0xFF2d2d30) : const Color(0xFFffffff),
      );

  void changeTheme(bool isDark) {
    this.isDark = isDark;
    notifyListeners();
  }
}
