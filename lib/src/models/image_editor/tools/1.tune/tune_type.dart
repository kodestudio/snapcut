import 'package:hive/hive.dart';
import 'package:snapcut/src/utils/hive_id.dart';

part 'tune_type.g.dart';

@HiveType(typeId: HiveId.tuneType)
enum TuneType {
  @HiveField(0)
  brightness,
  @HiveField(1)
  contrast,
  @HiveField(2)
  saturation,
  @HiveField(3)
  ambiance,
  @HiveField(4)
  hightlights,
  @HiveField(5)
  shadows,
  @HiveField(6)
  warmth,
}
