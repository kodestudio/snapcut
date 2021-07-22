import 'package:hive/hive.dart';
import 'package:snapcut/src/models/filter_tool/.filter.dart';
import 'package:snapcut/src/models/snapcut_image/snapcut_image.dart';

class SnapcutImageDb {
  late Box<SnapcutImage?> _box;

  Future<void> init() async {
    Hive.registerAdapter(BlendModeAdapter());
    Hive.registerAdapter(ToolTypeAdapter());
    Hive.registerAdapter(FilterToolTypeAdapter());
    Hive.registerAdapter(ColorFilterToolAdapter());
    Hive.registerAdapter(MatrixFilterToolAdapter());
    Hive.registerAdapter(SnapcutImageAdapter());
    Hive.registerAdapter(TuneTypeAdapter());
    Hive.registerAdapter(TuneFilterToolAdapter());
    _box = await Hive.openBox('seed_image');
  }

  SnapcutImage? get snapcutImage => _box.get('seed_image', defaultValue: null);
  set snapcutImage(SnapcutImage? si) => _box.put('seed_image', si);
}
