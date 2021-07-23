import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/_internal/universal_picker/universal_picker.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/db/snapcut_db.dart';
import 'package:snapcut/src/models/filter_tool/.filter.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool_type.dart';
import 'package:snapcut/src/models/snapcut_image/snapcut_image.dart';

final snapcutImageControllerProvider = StateNotifierProvider<SnapcutImageController, SnapcutImage?>((ref) => SnapcutImageController());

class SnapcutImageController extends StateNotifier<SnapcutImage?> {
  SnapcutImageController() : super(null) {
    if (kIsWeb) return;
    var si = SnapcutDb.singleton.image.snapcutImage;
    if (si != null && si.path != null) {
      if (io.File(si.path!).existsSync()) {
        state = si;
      } else {
        SnapcutDb.singleton.image.snapcutImage = null;
      }
    }
  }

  void saveImage(SnapcutImage snapcutImage) {
    state = snapcutImage;
  }

  void openImage() async {
    UniversalPicker universalPicker = UniversalPicker();
    await universalPicker.open();
    var si = SnapcutImage();
    List<FilterToolType> defaultFilter = [];
    if (kIsWeb) {
      if (universalPicker.uint8list != null) {
        si.open(universalPicker.uint8list!, defaultFilter);

        state = si;
      }
    } else {
      if (universalPicker.path != null) {
        si.open(universalPicker.path!, defaultFilter);
        state = si;
        SnapcutDb.singleton.image.snapcutImage = state;
      }
    }
  }
}
