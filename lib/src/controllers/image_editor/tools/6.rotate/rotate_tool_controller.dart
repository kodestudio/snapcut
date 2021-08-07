import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/models/filter_tool/collection_filter_tool.dart';
import 'package:snapcut/src/models/filter_tool/custom_filter_tool/rotate_filter_tool.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool.dart';
import 'package:snapcut/src/models/filter_tool/tool_type.dart';

final rotateToolControllerProvider = StateNotifierProvider.autoDispose<RotateToolController, RotateInfo>((ref) {
  return RotateToolController(ref.read);
});

class RotateInfo {
  final int quarterTurns;
  final bool horizontalFlipped;
  final bool verticalFlipped;

  RotateInfo({
    required this.quarterTurns,
    required this.horizontalFlipped,
    required this.verticalFlipped,
  });
}

class RotateToolController extends StateNotifier<RotateInfo> {
  RotateToolController(this._read)
      : super(RotateInfo(
          quarterTurns: 0,
          horizontalFlipped: false,
          verticalFlipped: false,
        ));

  final Reader _read;

  bool isInitImage = false;

  void rerenderImage() {
    var cloneImage = _read(cloneSnapcutImageControllerProvider);
    CollectionFilterTool currentTool;

    if (isInitImage == false) {
      currentTool = const CollectionFilterTool(ToolType.rotate, []);

      currentTool = currentTool.addFilter(
        RotateFilterTool(
          quarterTurns: state.quarterTurns,
          horizontalFlipped: state.horizontalFlipped,
          verticalFlipped: state.verticalFlipped,
        ),
      );
      cloneImage.state = cloneImage.state.clone().addCollectionInFrontLayer(currentTool);
      isInitImage = true;
    } else {
      currentTool = const CollectionFilterTool(ToolType.rotate, []);

      currentTool = currentTool.addFilter(
        RotateFilterTool(
          quarterTurns: state.quarterTurns,
          horizontalFlipped: state.horizontalFlipped,
          verticalFlipped: state.verticalFlipped,
        ),
      );
      cloneImage.state = cloneImage.state.clone().replaceLastCollectionInFrontLayer(currentTool);
    }
  }

  void rotate(int quarterTurns) {
    if (quarterTurns < -2) quarterTurns = 1;
    if (quarterTurns > 2) quarterTurns = -1;

    state = RotateInfo(
      quarterTurns: quarterTurns,
      horizontalFlipped: state.horizontalFlipped,
      verticalFlipped: state.verticalFlipped,
    );
  }

  void flip(Axis axis) {
    state = RotateInfo(
      quarterTurns: state.quarterTurns,
      horizontalFlipped: axis == Axis.horizontal ? !state.horizontalFlipped : state.horizontalFlipped,
      verticalFlipped: axis == Axis.vertical ? !state.verticalFlipped : state.verticalFlipped,
    );
  }
}
