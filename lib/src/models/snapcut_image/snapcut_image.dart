import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:snapcut/src/models/snapcut_image/image_filter_tool_layer.dart';
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
  late final ImageFilterToolLayer imageFilterToolLayer;

  void open(data, ImageFilterToolLayer imageFilterToolLayer);

  SnapcutImage clone({ImageFilterToolLayer? imageFilterToolLayer});

  factory SnapcutImage() => getPlatformSnapcutImage();

  Widget? cacheImage;
  Stream<Widget?> get image;
}
