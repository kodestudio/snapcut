import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:snapcut/src/utils/db_id.dart';

import '../filter_tool.dart';

part 'matrix_filter_tool.g.dart';

@HiveType(typeId: HiveId.matrixFilterTool)
class MatrixFilterTool implements FilterTool {
  @HiveField(0)
  final List<List<double>> matrix;

  MatrixFilterTool(this.matrix);

  @override
  Widget filter(Widget child) {
    return ColorFiltered(
      colorFilter: ColorFilter.matrix(matrix.flat),
      child: child,
    );
  }
}

extension FlatMatrixX on List<List<double>> {
  List<double> get flat => expand((e) => e).toList();
}
