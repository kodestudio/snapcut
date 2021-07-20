import 'dart:typed_data';

import 'universal_picker_locator.dart' if (dart.library.html) 'universal_picker_web.dart' if (dart.library.io) 'universal_picker_io.dart';

abstract class UniversalPicker {
  String? path;
  Uint8List? uint8list;

  Future<void> open();

  factory UniversalPicker() => getPlatformPicker();
}
