import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapcut/src/app.dart';
import 'package:snapcut/src/db/snapcut_db.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SnapcutDb.singleton.init();

  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('vi', 'VN'),
          Locale('en', 'US'),
        ],
        path: 'assets/translations',
        saveLocale: true,
        child: const MyApp(),
      ),
    ),
  );
}
