import 'package:hive_flutter/adapters.dart';
import 'package:snapcut/src/db/seed_image_db.dart';

class SnapcutDb {
  static final SnapcutDb _singleton = SnapcutDb._internal();
  static final SnapcutDb singleton = _singleton;
  SnapcutDb._internal();
  factory SnapcutDb() => _singleton;

  final SeedImageDb seedImage = SeedImageDb();

  Future<void> init() async {
    await Hive.initFlutter();
    await seedImage.init();
  }
}
