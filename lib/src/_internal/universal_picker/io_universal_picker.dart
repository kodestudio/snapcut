import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'universal_picker.dart';
import 'package:filepicker_windows/filepicker_windows.dart' as picker;

class IoUniversalPicker implements UniversalPicker {
  @override
  String? path;

  @override
  Uint8List? uint8list;

  @override
  Future<void> open() async {
    if (!Platform.isWindows) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image,
      );
      if (result != null) path = result.files.first.path;
    } else {
      final file = picker.OpenFilePicker();
      file.hidePinnedPlaces = true;
      file.forcePreviewPaneOn = true;
      file.filterSpecification = {
        'JPEG Files': '*.jpg;*.jpeg',
        'PNG Files': '*.png',
      };
      file.title = 'Select an image';
      final result = file.getFile();
      path = result?.path;
    }
  }
}

UniversalPicker getPlatformPicker() => IoUniversalPicker();
