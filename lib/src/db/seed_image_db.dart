import 'package:hive/hive.dart';
import 'package:snapseed/src/models/filter_tool/.filter.dart';
import 'package:snapseed/src/models/seed_image/seed_image.dart';

class SeedImageDb {
  late Box<SeedImage?> _box;

  Future<void> init() async {
    Hive.registerAdapter(BlendModeAdapter());
    Hive.registerAdapter(ToolTypeAdapter());
    Hive.registerAdapter(FilterToolTypeAdapter());
    Hive.registerAdapter(ColorFilterToolAdapter());
    Hive.registerAdapter(MatrixFilterToolAdapter());
    Hive.registerAdapter(SeedImageAdapter());
    _box = await Hive.openBox('seed_image');
  }

  SeedImage? get seedImage => _box.get('seed_image', defaultValue: null);
  set seedImage(SeedImage? si) => _box.put('seed_image', si);
}
