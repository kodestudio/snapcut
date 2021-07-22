import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool_type.dart';

import 'snapcut_image.dart';

class WebSnapcutImage implements SnapcutImage {
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
  void open(data, List<FilterToolType> filterToolTypes) {
    bytes = data as Uint8List;
    this.filterToolTypes = filterToolTypes;
  }

  @override
  SnapcutImage clone({List<FilterToolType>? newFilterToolTypes}) {
    final si = WebSnapcutImage();
    si.open(bytes!, newFilterToolTypes ?? filterToolTypes);
    return si;
  }
}

SnapcutImage getPlatformSnapcutImage() => WebSnapcutImage();
