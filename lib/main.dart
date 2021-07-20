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

  await SnapseedDb.singleton.init();

  runApp(const ProviderScope(child: MyApp()));
}
