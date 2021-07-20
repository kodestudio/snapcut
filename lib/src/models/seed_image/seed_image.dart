import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:snapseed/src/models/filter_tool/filter_tool_type.dart';
import 'package:snapseed/src/utils/db_id.dart';

import 'seed_image_locator.dart' if (dart.library.io) 'io_seed_image.dart' if (dart.library.html) 'web_seed_image.dart';

part 'seed_image.g.dart';

@HiveType(typeId: HiveId.seedImage)
abstract class SeedImage {
  @HiveField(0)
  Uint8List? bytes;
  @HiveField(1)
  String? path;
  @HiveField(2)
  late List<FilterToolType> filterToolTypes;

  void openFile(data, List<FilterToolType> filterToolTypes);

  factory SeedImage() => getPlatformSeedImage();

  Widget get image;
}
