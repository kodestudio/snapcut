import 'package:hive/hive.dart';
import 'package:snapcut/src/utils/db_id.dart';

part 'tool_type.g.dart';

@HiveType(typeId: HiveId.toolType)
enum ToolType {
  @HiveField(0)
  tune, // FIX: Unimplement
  @HiveField(1)
  details, // FIX: Unimplement
  @HiveField(2)
  curves, // FIX: Unimplement
  @HiveField(3)
  whiteBalance, // FIX: Unimplement
  @HiveField(4)
  crop, // FIX: Unimplement
  @HiveField(5)
  rotate, // FIX: Unimplement
  @HiveField(6)
  perspective, // FIX: Unimplement
  @HiveField(7)
  expand, // FIX: Unimplement
  @HiveField(8)
  selective, // FIX: Unimplement
  @HiveField(9)
  brush, // FIX: Unimplement
  @HiveField(10)
  healing, // FIX: Unimplement
  @HiveField(11)
  hdr, // FIX: Unimplement
  @HiveField(12)
  glamourGlow, // FIX: Unimplement
  @HiveField(13)
  tonalContrast, // FIX: Unimplement
  @HiveField(14)
  drama, // FIX: Unimplement
  @HiveField(15)
  vintage, // FIX: Unimplement
  @HiveField(16)
  grainyFilms, // FIX: Unimplement
  @HiveField(17)
  retrolux, // FIX: Unimplement
  @HiveField(18)
  grunge, // FIX: Unimplement
  @HiveField(19)
  blackAndWhite, // FIX: Unimplement
  @HiveField(20)
  noir, // FIX: Unimplement
  @HiveField(21)
  portrait, // FIX: Unimplement
  @HiveField(22)
  headPose, // FIX: Unimplement
  @HiveField(23)
  lensBlur, // FIX: Unimplement
  @HiveField(24)
  vignette, // FIX: Unimplement
  @HiveField(25)
  doubleExposure, // FIX: Unimplement
  @HiveField(26)
  text, // FIX: Unimplement
  @HiveField(27)
  frames, // FIX: Unimplement
}
