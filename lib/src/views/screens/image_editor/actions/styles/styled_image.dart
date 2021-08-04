import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';
import 'package:snapcut/src/models/filter_tool/preset_filter_tool.dart';
import 'package:snapcut/src/utils/styles.dart';

class StyledImage extends HookConsumerWidget {
  const StyledImage({
    Key? key,
    required this.preset,
  }) : super(key: key);

  final PresetFilterTool preset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final image = ref.watch(snapcutImageControllerProvider)!.clone();
    image.imageFilterToolLayer.merge(preset.imageFilterToolLayer);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Insets.sm),
      child: Center(
        child: SizedBox(
          height: 90.0,
          width: 75.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 60,
                width: 80,
                child: StreamBuilder<Widget?>(
                  stream: image.image,
                  builder: (context, snapshot) {
                    if (snapshot.data == null) return const Center(child: CircularProgressIndicator());
                    return Center(child: snapshot.data);
                  },
                ),
              ),
              const SizedBox(height: Insets.sm),
              Text(preset.name.tr(), overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
