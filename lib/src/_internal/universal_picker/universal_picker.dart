import 'dart:typed_data';

import 'universal_picker_locator.dart' if (dart.library.html) 'web_universal_picker.dart' if (dart.library.io) 'io_universal_picker.dart';

abstract class UniversalPicker {
  String? path;
  Uint8List? uint8list;

  Future<void> open();

  factory UniversalPicker() => getPlatformPicker();
}
