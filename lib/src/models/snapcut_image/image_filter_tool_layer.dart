import 'package:hive_flutter/adapters.dart';
import 'package:snapcut/src/models/filter_tool/collection_filter_tool.dart';
import 'package:snapcut/src/utils/hive_id.dart';

part 'image_filter_tool_layer.g.dart';

@HiveType(typeId: HiveId.imageFilterToolLayer)
class ImageFilterToolLayer {
  static ImageFilterToolLayer defaultFilter = const ImageFilterToolLayer(back: [], front: [], middle: []);

  @HiveField(0)
  final List<CollectionFilterTool> front;
  @HiveField(1)
  final List<CollectionFilterTool> middle;
  @HiveField(2)
  final List<CollectionFilterTool> back;

  const ImageFilterToolLayer({
    this.front = const <CollectionFilterTool>[],
    this.middle = const <CollectionFilterTool>[],
    this.back = const <CollectionFilterTool>[],
  });

  ImageFilterToolLayer clone() => ImageFilterToolLayer(
        back: back,
        middle: middle,
        front: front,
      );

  ImageFilterToolLayer copyWith({
    List<CollectionFilterTool>? front,
    List<CollectionFilterTool>? middle,
    List<CollectionFilterTool>? back,
  }) =>
      ImageFilterToolLayer(
        front: front ?? this.front,
        middle: middle ?? this.middle,
        back: back ?? this.back,
      );

  ImageFilterToolLayer merge(ImageFilterToolLayer other) => ImageFilterToolLayer(
        front: [...front, ...other.front],
        middle: [...middle, ...other.middle],
        back: [...back, ...other.back],
      );
}
