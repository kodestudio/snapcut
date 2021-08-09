import 'package:hive/hive.dart';
import 'package:snapcut/src/models/filter_tool/.filter.dart';
import 'package:snapcut/src/models/filter_tool/custom_filter_tool/rotate_filter_tool.dart';
import 'package:snapcut/src/models/snapcut_image/snapcut_image.dart';

class SnapcutImageDb {
  late Box<SnapcutImage?> _box;

  Future<void> init() async {
    Hive.registerAdapter(BlendModeAdapter());
    Hive.registerAdapter(ToolTypeAdapter());
    Hive.registerAdapter(CollectionFilterToolAdapter());
    Hive.registerAdapter(SnapcutImageAdapter());
    Hive.registerAdapter(TuneTypeAdapter());
    Hive.registerAdapter(TuneFilterToolAdapter());
    Hive.registerAdapter(ImageFilterToolLayerAdapter());
    Hive.registerAdapter(RotateFilterToolAdapter());
    Hive.registerAdapter(BrushLevelAdapter());
    Hive.registerAdapter(BrushTypeAdapter());
    Hive.registerAdapter(BrushFilterToolAdapter());
    Hive.registerAdapter(BrushPointsAdapter());
    Hive.registerAdapter(PointAdapter());

    _box = await Hive.openBox('seed_image');
  }

  SnapcutImage? get snapcutImage => _box.get('seed_image', defaultValue: null);
  set snapcutImage(SnapcutImage? si) => _box.put('seed_image', si);
}
