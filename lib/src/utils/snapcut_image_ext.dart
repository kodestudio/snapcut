import 'package:snapcut/src/models/filter_tool/filter_tool_type.dart';
import 'package:snapcut/src/models/snapcut_image/snapcut_image.dart';

extension GetLastFilter on SnapcutImage {
  FilterToolType get currentFilterToolType => filterToolTypes.last;
}
