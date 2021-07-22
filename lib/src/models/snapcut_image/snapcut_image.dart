import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool_type.dart';
import 'package:snapcut/src/utils/hive_id.dart';

import 'snapcut_image_locator.dart' if (dart.library.io) 'io_snapcut_image.dart' if (dart.library.html) 'web_snapcut_image.dart';

part 'snapcut_image.g.dart';

@HiveType(typeId: HiveId.snapcutImage)
abstract class SnapcutImage {
  @HiveField(0)
  Uint8List? bytes;
  @HiveField(1)
  String? path;
  @HiveField(2)
  late final List<FilterToolType> filterToolTypes;

  void open(data, List<FilterToolType> filterToolTypes);

  SnapcutImage clone({List<FilterToolType>? newFilterToolTypes});

  factory SnapcutImage() => getPlatformSnapcutImage();

  Widget get image;
}
