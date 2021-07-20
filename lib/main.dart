import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapcut/src/app.dart';
import 'package:snapcut/src/db/snapseed_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    // DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SnapcutDb.singleton.init();

  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [Locale('vi', 'VN')],
        path: 'assets/translations',
        fallbackLocale: const Locale('vi', 'VN'),
        child: const MyApp(),
      ),
    ),
  );
}
