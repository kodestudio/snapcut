import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'universal_picker.dart';

class UniversalPickerWeb implements UniversalPicker {
  @override
  String? path;

  @override
  Uint8List? uint8list;

  @override
  Future<void> open() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) uint8list = result.files.first.bytes;
  }
}

UniversalPicker getPlatformPicker() => UniversalPickerWeb();
