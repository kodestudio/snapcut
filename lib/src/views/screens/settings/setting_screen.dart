import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapseed/src/controllers/settings/settings_controller.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(settingsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          iconSize: 20,
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          'Cài đặt',
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: controller.isDark ? Colors.white : Colors.black,
              ),
        ),
      ),
      body: Column(
        children: [
          _settingFolder(
            context,
            title: 'Giao diện',
            children: [
              ListTile(
                onTap: () => controller.changeTheme(!controller.isDark),
                title: const Text('Giao diện tối'),
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
                title,
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
