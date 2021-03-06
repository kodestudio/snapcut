import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapcut/src/controllers/image_editor/tools/1.tune/tune_tool_controller.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune_type.dart';

final tuneControlPanelControllerProvider = ChangeNotifierProvider.autoDispose((ref) => TuneControlPanelController());

class TuneControlPanelController extends ChangeNotifier {
  TuneControlPanelController();

  bool visible = false;

  double initOffset = 0.0;
  double localPositionOffset = 0.0;

  bool isInit = false;
  double minOffset = 0;
  double maxOffset = 0;
  double? lastOffset;

  TuneValueWithType? currentTuneValueWithType;

  void updateCurrentTuneWithType(Tune baseTune) {
    int currType = (maxOffset - (currentOffset) + 24) ~/ 48.0;
    currentTuneValueWithType = TuneValueWithType(baseTune, TuneType.values[currType]);
  }

  double get currentOffset {
    double res = (lastOffset ?? maxOffset) + (localPositionOffset - initOffset);

    if (res < minOffset) res = minOffset;
    if (res > maxOffset) res = maxOffset;

    return res;
  }

  void setInitPosition(double value) {
    initOffset = value;
    localPositionOffset = value;
  }

  void setVisible(bool value) {
    visible = value;
    notifyListeners();
  }

  void setLocalPosition(double value) {
    localPositionOffset = value;
    notifyListeners();
  }

  void updateLastOffset() {
    lastOffset = currentOffset;
    initOffset = lastOffset!;
    localPositionOffset = lastOffset!;
    lastOffset = maxOffset - ((maxOffset - lastOffset! + 24) ~/ 48.0) * 48.0;
  }
}
