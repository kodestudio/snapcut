import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/snapcut_image_controller.dart';
import 'package:snapcut/src/models/snapcut_image/snapcut_image.dart';

final cloneSnapcutImageControllerProvider = StateProvider<SnapcutImage>(
  (ref) => ref.watch(snapcutImageControllerProvider)!,
);
