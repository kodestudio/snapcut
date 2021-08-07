import 'package:hive/hive.dart';
import 'package:snapcut/src/utils/hive_id.dart';

import 'filter_tool.dart';
import 'tool_type.dart';

part 'collection_filter_tool.g.dart';

@HiveType(typeId: HiveId.typeFilterTool)
class CollectionFilterTool {
  @HiveField(0)
  final ToolType type;
  @HiveField(1)
  final List<FilterTool> filterToolList;

  const CollectionFilterTool(this.type, this.filterToolList);

  CollectionFilterTool addFilter(FilterTool filterTool) => CollectionFilterTool(type, [...filterToolList, filterTool]);
  CollectionFilterTool replaceFilters(List<FilterTool> filterToolList) => CollectionFilterTool(type, [...filterToolList]);
}
