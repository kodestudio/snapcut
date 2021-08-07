import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snapcut/src/models/filter_tool/collection_filter_tool.dart';
import 'package:snapcut/src/models/snapcut_image/image_filter_tool_layer.dart';

import 'snapcut_image.dart';

class WebSnapcutImage implements SnapcutImage {
  @override
  Uint8List? bytes;

  @override
  String? path;

  @override
  late ImageFilterToolLayer imageFilterToolLayer;

  @override
  Widget? cacheImage;

  bool isRenderDone = false;

  @override
  Stream<Widget?> get image async* {
    if (cacheImage != null && isRenderDone) {
      yield cacheImage!;
    } else {
      yield cacheImage;
      var collectionFilterTools = imageFilterToolLayer.back;

      Widget bottom = const SizedBox();
      for (var typeFilterTool in collectionFilterTools) {
        for (var tool in typeFilterTool.filterToolList) {
          bottom = await tool.filter(bottom);
        }
      }

      collectionFilterTools = imageFilterToolLayer.middle;

      Widget img = Image.memory(bytes!);
      for (var typeFilterTool in collectionFilterTools) {
        for (var tool in typeFilterTool.filterToolList) {
          img = await tool.filter(img);
        }
      }

      collectionFilterTools = imageFilterToolLayer.front;

      for (var typeFilterTool in collectionFilterTools) {
        for (var tool in typeFilterTool.filterToolList) {
          img = await tool.filter(img);
        }
      }

      isRenderDone = true;
      cacheImage = Stack(children: [bottom, img]);
      yield Stack(children: [bottom, img]);
    }
  }

  @override
  void open(data, ImageFilterToolLayer imageFilterToolLayer) {
    bytes = data as Uint8List;
    this.imageFilterToolLayer = imageFilterToolLayer;
  }

  @override
  SnapcutImage clone({ImageFilterToolLayer? imageFilterToolLayer}) {
    final si = WebSnapcutImage();
    si.open(bytes!, imageFilterToolLayer ?? this.imageFilterToolLayer.clone());
    si.cacheImage = cacheImage;
    si.isRenderDone = false;
    return si;
  }

  @override
  SnapcutImage addCollectionInBackLayer(CollectionFilterTool collection) {
    List<CollectionFilterTool> layer = List.from(imageFilterToolLayer.back);
    layer.add(collection);

    return clone(
      imageFilterToolLayer: ImageFilterToolLayer(
        back: layer,
        middle: imageFilterToolLayer.middle,
        front: imageFilterToolLayer.front,
      ),
    );
  }

  @override
  SnapcutImage addCollectionInMiddleLayer(CollectionFilterTool collection) {
    List<CollectionFilterTool> layer = List.from(imageFilterToolLayer.middle);
    layer.add(collection);

    return clone(
      imageFilterToolLayer: ImageFilterToolLayer(
        back: imageFilterToolLayer.back,
        middle: layer,
        front: imageFilterToolLayer.front,
      ),
    );
  }

  @override
  SnapcutImage addCollectionInFrontLayer(CollectionFilterTool collection) {
    List<CollectionFilterTool> layer = List.from(imageFilterToolLayer.front);
    layer.add(collection);

    return clone(
      imageFilterToolLayer: ImageFilterToolLayer(
        back: imageFilterToolLayer.back,
        middle: imageFilterToolLayer.middle,
        front: layer,
      ),
    );
  }

  @override
  SnapcutImage replaceLastCollectionInBackLayer(CollectionFilterTool collection) {
    List<CollectionFilterTool> layer = List.from(imageFilterToolLayer.back);
    layer.removeLast();
    layer.add(collection);

    return clone(
      imageFilterToolLayer: ImageFilterToolLayer(
        back: layer,
        middle: imageFilterToolLayer.middle,
        front: imageFilterToolLayer.front,
      ),
    );
  }

  @override
  SnapcutImage replaceLastCollectionInMiddleLayer(CollectionFilterTool collection) {
    List<CollectionFilterTool> layer = List.from(imageFilterToolLayer.middle);
    layer.removeLast();
    layer.add(collection);

    return clone(
      imageFilterToolLayer: ImageFilterToolLayer(
        back: imageFilterToolLayer.back,
        middle: layer,
        front: imageFilterToolLayer.front,
      ),
    );
  }

  @override
  SnapcutImage replaceLastCollectionInFrontLayer(CollectionFilterTool collection) {
    List<CollectionFilterTool> layer = List.from(imageFilterToolLayer.front);
    layer.removeLast();
    layer.add(collection);

    return clone(
      imageFilterToolLayer: ImageFilterToolLayer(
        back: imageFilterToolLayer.back,
        middle: imageFilterToolLayer.middle,
        front: layer,
      ),
    );
  }
}

SnapcutImage getPlatformSnapcutImage() => WebSnapcutImage();
