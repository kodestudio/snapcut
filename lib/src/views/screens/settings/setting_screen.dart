import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/settings/settings_controller.dart';
import 'package:snapcut/src/utils/router.dart';

class LanguageOption {
  const LanguageOption(this.name, this.locale);

  final String name;
  final Locale locale;
}

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(settingsControllerProvider);
    const languageOptions = [
      LanguageOption('Tiếng việt', Locale('vi', 'VN')),
      LanguageOption('English', Locale('en', 'US')),
    ];
    final currentLanguage = 'appInfo.language'.tr();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => SnapcutRouter.pop(context),
          iconSize: 20,
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'settings.name'.tr(),
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: controller.isDark ? Colors.white : Colors.black,
              ),
        ),
      ),
      body: Column(
        children: [
          _settingFolder(
            context,
            title: 'settings.appearance',
            children: [
              ListTile(
                onTap: () => controller.changeTheme(!controller.isDark),
                title: Text('settings.darkTheme'.tr()),
                trailing: Switch(
                  activeColor: const Color(0xFF6194D5),
                  onChanged: (isDark) {
                    controller.changeTheme(isDark);
                  },
                  value: controller.isDark,
                ),
              ),
            ],
          ),
          _settingFolder(
            context,
            title: 'settings.language',
            children: [
              for (final lang in languageOptions)
                ListTile(
                  title: Text(lang.name),
                  onTap: () {
                    EasyLocalization.of(context)!.setLocale(lang.locale);
                  },
                  trailing: Checkbox(
                    activeColor: Theme.of(context).colorScheme.primary,
                    value: currentLanguage == lang.name,
                    onChanged: (_) {
                      EasyLocalization.of(context)!.setLocale(lang.locale);
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _settingFolder(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 35.0,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                title.tr(),
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ),
        ...children,
      ],
    );
  }
}
