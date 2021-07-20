import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapseed/src/controllers/settings/settings_controller.dart';
import 'package:snapseed/src/utils/globals.dart';
import 'package:snapseed/src/views/screens/home_screen.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: settings.theme,
      navigatorKey: Globals.appNav,
      home: const HomeScreen(),
    );
  }
}
