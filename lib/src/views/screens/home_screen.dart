import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/seed_image_controller.dart';
import 'package:snapcut/src/utils/globals.dart';
import 'package:snapcut/src/views/screens/image_editor/image_editor_screen.dart';
import 'package:snapcut/src/views/screens/image_editor/components/top_tool.dart';
import 'package:snapcut/src/views/widgets/bottom/bottom.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedImage = ref.watch(seedImageControllerProvider);

    return Scaffold(
      body: seedImage == null
          ? const EmptyScreen()
          : Navigator(
              key: Globals.bodyNav,
              onGenerateRoute: (route) => MaterialPageRoute(
                settings: route,
                builder: (context) => const ImageEditorScreen(),
              ),
            ),
      bottomNavigationBar: seedImage == null ? null : const BottomActionBar(),
    );
  }
}

class EmptyScreen extends HookConsumerWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedImageCtl = ref.watch(seedImageControllerProvider.notifier);
    return Column(
      children: [
        const TopTool(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              seedImageCtl.openImage();
            },
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_sharp,
                      size: 150,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    Text(
                      'home.body.tapToSelectImage'.tr(),
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
