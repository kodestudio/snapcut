import 'package:hive_flutter/adapters.dart';
import 'package:snapseed/src/db/seed_image_db.dart';

class SnapseedDb {
  static final SnapseedDb _singleton = SnapseedDb._internal();
  static final SnapseedDb singleton = _singleton;
  SnapseedDb._internal();
  factory SnapseedDb() => _singleton;

  final SeedImageDb seedImage = SeedImageDb();

  Future<void> init() async {
    await Hive.initFlutter();
    await seedImage.init();
  }
}
