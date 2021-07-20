import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapseed/src/controllers/seed_image_controller.dart';
import 'package:snapseed/src/utils/globals.dart';
import 'package:snapseed/src/utils/styles.dart';
import 'package:snapseed/src/views/screens/settings/setting_screen.dart';

class TopTool extends HookConsumerWidget {
  const TopTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedImageCtl = ref.watch(seedImageControllerProvider.notifier);

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 56.0,
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.background.withOpacity(0.2),
                      Theme.of(context).colorScheme.background.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            AppBar(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              leadingWidth: 80.0,
              leading: Center(
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  onPressed: () {
                    seedImageCtl.openImage();
                  },
                  child: const Text('MỞ'),
                ),
              ),
              actions: [
                SnapseedIconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.layers),
                ),
                const SizedBox(width: Insets.sm),
                SnapseedIconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.info),
                ),
                const SizedBox(width: Insets.sm),
                SnapseedIconButton(
                  onPressed: () {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(MediaQuery.of(context).size.width, 0, 0, 0),
                      items: [
                        PopupMenuItem(
                          onTap: () {
                            Navigator.push(
                              Globals.appNav.context,
                              CupertinoPageRoute(builder: (_) => const SettingScreen()),
                            );
                          },
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                          child: const SizedBox(width: 100.0, child: Text('Cài đặt')),
                        ),
                        PopupMenuItem(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                          child: const SizedBox(width: 100.0, child: Text('Hướng đẫn')),
                        ),
                        PopupMenuItem(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                          child: const SizedBox(width: 100.0, child: Text('Đánh giá')),
                        ),
                      ],
                    );
                  },
                  icon: const Icon(Icons.more_vert_sharp),
                ),
                const SizedBox(width: Insets.sm),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SnapseedIconButton extends StatelessWidget {
  const SnapseedIconButton({Key? key, required this.onPressed, required this.icon}) : super(key: key);

  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      width: 36.0,
      child: RawMaterialButton(
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: Center(
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onBackground),
            child: icon,
          ),
        ),
      ),
    );
  }
}
