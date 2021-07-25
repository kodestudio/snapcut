import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';
import 'package:snapcut/src/utils/globals.dart';
import 'package:snapcut/src/utils/styles.dart';
import 'package:snapcut/src/views/screens/settings/setting_screen.dart';

class TopTool extends HookConsumerWidget {
  const TopTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snapcutImageController = ref.watch(snapcutImageControllerProvider.notifier);

    return Column(
      children: [
        Stack(
          children: [
            if (!kIsWeb)
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
                  onPressed: () => snapcutImageController.openImage(),
                  child: Text('home.top.open'.tr()),
                ),
              ),
              actions: [
                SnapcutIconButton(
                  onPressed: () {},
                  label: 'home.top.editStack',
                  icon: const Icon(Icons.layers),
                ),
                const SizedBox(width: Insets.sm),
                SnapcutIconButton(
                  onPressed: () {},
                  label: 'home.top.imageDetails',
                  icon: const Icon(Icons.info),
                ),
                const SizedBox(width: Insets.sm),
                SnapcutIconButton(
                  onPressed: () {
                    const basePath = 'home.top.moreOptionsChildren';

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
                          child: SizedBox(width: 150.0, child: Text('$basePath.settings'.tr())),
                        ),
                        PopupMenuItem(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                          child: SizedBox(width: 150.0, child: Text('$basePath.tutorials'.tr())),
                        ),
                        PopupMenuItem(
                          textStyle: Theme.of(context).textTheme.bodyText1!.copyWith(color: Theme.of(context).colorScheme.onBackground),
                          child: SizedBox(width: 150.0, child: Text('$basePath.helpAndFeedback'.tr())),
                        ),
                      ],
                    );
                  },
                  label: 'home.top.moreOptions',
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

class SnapcutIconButton extends StatelessWidget {
  const SnapcutIconButton({Key? key, required this.onPressed, required this.icon, required this.label}) : super(key: key);

  final VoidCallback onPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.0,
      width: 36.0,
      child: Tooltip(
        message: label.tr(),
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
      ),
    );
  }
}
