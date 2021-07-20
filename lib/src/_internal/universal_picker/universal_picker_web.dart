import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';

import 'universal_picker.dart';

class UniversalPickerWeb implements UniversalPicker {
  @override
  String? path;

  @override
  Uint8List? uint8list;

  UniversalPickerWeb({required String accept}) {
    // The desktop file picker plugin doesn't accept these input accept strings,
    // the pickImage function has a hardcoded image filter in it
  }

  @override
  Future<void> open() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) uint8list = result.files.first.bytes;
  }
}

UniversalPicker getPlatformPicker({required String accept}) => UniversalPickerWeb(accept: accept);
