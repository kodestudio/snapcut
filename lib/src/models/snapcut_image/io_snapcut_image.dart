import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snapcut/src/models/snapcut_image/image_filter_tool_layer.dart';

import 'snapcut_image.dart';

class IoSnapcutImage implements SnapcutImage {
  @override
  Uint8List? bytes;

  @override
  String? path;

  @override
  late ImageFilterToolLayer imageFilterToolLayer;

  @override
  Widget? cacheImage;

  @override
  Stream<Widget?> get image async* {
    if (cacheImage != null) {
      yield cacheImage!;
    } else {
      var collectionFilterTools = imageFilterToolLayer.back;

      Widget bottom = const SizedBox();
      for (var typeFilterTool in collectionFilterTools) {
        for (var tool in typeFilterTool.filterToolList) {
          bottom = await tool.filter(bottom);
        }
      }

      collectionFilterTools = imageFilterToolLayer.middle;

      Widget img = Image.file(File(path!));
      for (var typeFilterTool in collectionFilterTools) {
        for (var tool in typeFilterTool.filterToolList) {
          img = await tool.filter(img);
        }
      }
      collectionFilterTools = imageFilterToolLayer.front;

      Widget top = const SizedBox();
      for (var typeFilterTool in collectionFilterTools) {
        for (var tool in typeFilterTool.filterToolList) {
          top = await tool.filter(top);
        }
      }

      cacheImage ??= Stack(children: [bottom, img, top]);
      yield Stack(children: [bottom, img, top]);
    }
  }

  @override
  void open(data, ImageFilterToolLayer imageFilterToolLayer) {
    path = data as String;
    this.imageFilterToolLayer = imageFilterToolLayer;
  }

  @override
  SnapcutImage clone({ImageFilterToolLayer? imageFilterToolLayer}) {
    final si = IoSnapcutImage();
    si.open(path!, imageFilterToolLayer ?? this.imageFilterToolLayer.clone());
    return si;
  }
}

SnapcutImage getPlatformSnapcutImage() => IoSnapcutImage();
