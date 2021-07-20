import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/seed_image_controller.dart';

class EditedImage extends HookConsumerWidget {
  const EditedImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedImage = ref.watch(seedImageControllerProvider)!;

    return Stack(
      children: [
        Center(child: seedImage.image),
      ],
    );
  }
}
