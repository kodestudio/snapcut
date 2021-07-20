import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snapseed/src/models/filter_tool/filter_tool_type.dart';

import 'seed_image.dart';

class WebSeedImage implements SeedImage {
  @override
  Uint8List? bytes;

  @override
  String? path;

  @override
  late List<FilterToolType> filterToolTypes;

  @override
  Widget get image {
    Widget img = Image.memory(bytes!);

    for (var typeFilterTool in filterToolTypes) {
      for (var tool in typeFilterTool.filterToolList) {
        img = tool.filter(img);
      }
    }

    return img;
  }

  @override
  void openFile(data, List<FilterToolType> filterToolTypes) {
    bytes = data as Uint8List;
    this.filterToolTypes = filterToolTypes;
  }
}

SeedImage getPlatformSeedImage() => WebSeedImage();
