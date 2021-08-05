//ignore_for_file:prefer_final_fields
import 'dart:collection';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/models/filter_tool/.filter.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune_type.dart';

final tuneToolControllerProvider = StateNotifierProvider.autoDispose<TuneToolController, TuneValueWithType>((ref) => TuneToolController(ref));

class TuneValueWithType {
  const TuneValueWithType(this.tune, this.type);

  final Tune tune;
  final TuneType type;

  int get tuneValue {
    switch (type) {
      case TuneType.brightness:
        return tune.brightness;
      case TuneType.contrast:
        return tune.contrast;
      case TuneType.saturation:
        return tune.saturation;
      case TuneType.ambiance:
        return tune.ambiance;
      case TuneType.hightlights:
        return tune.hightlights;
      case TuneType.shadows:
        return tune.shadows;
      case TuneType.warmth:
        return tune.warmth;
    }
  }

  String get typeTextWithTuneValue => 'imageEditor.tools.tuneChildren.${type.toString().substring(9)}'.tr(
        args: [tuneValue.toString()],
      );

  String get typeText => 'imageEditor.tools.tuneChildren.${type.toString().substring(9)}'.tr(
        args: [''],
      );

  TuneValueWithType update(TuneType type, int value) {
    switch (type) {
      case TuneType.brightness:
        return TuneValueWithType(tune.copyWith(brightness: value), type);
      case TuneType.contrast:
        return TuneValueWithType(tune.copyWith(contrast: value), type);
      case TuneType.saturation:
        return TuneValueWithType(tune.copyWith(saturation: value), type);
      case TuneType.ambiance:
        return TuneValueWithType(tune.copyWith(ambiance: value), type);
      case TuneType.hightlights:
        return TuneValueWithType(tune.copyWith(hightlights: value), type);
      case TuneType.shadows:
        return TuneValueWithType(tune.copyWith(shadows: value), type);
      case TuneType.warmth:
        return TuneValueWithType(tune.copyWith(warmth: value), type);
    }
  }
}

class TuneToolController extends StateNotifier<TuneValueWithType> {
  TuneToolController(this.ref) : super(const TuneValueWithType(Tune.defaultValue, TuneType.brightness));

  final ProviderRefBase ref;

  bool isInitCloneImage = false;

  Queue<int> updateValue = Queue();

  void _updateImage(int value) {
    // Lấy object cloneImage
    final cloneImage = ref.read(cloneSnapcutImageControllerProvider);
    // Lưu lại trạng thái trước khi thay đổi của cloneImage
    var preCloneImage = cloneImage.state.clone();

    // Check xem đã thêm toolType mới chưa
    if (isInitCloneImage == false) {
      preCloneImage = preCloneImage.clone(
        imageFilterToolLayer: preCloneImage.imageFilterToolLayer.copyWith(
          middle: [
            ...preCloneImage.imageFilterToolLayer.middle,
            const CollectionFilterTool(ToolType.tune, []),
          ],
        ),
      );
      isInitCloneImage = true;
    }

    // Lấy phần CollectionFilterTool đang xử lí trong trường hợp này đang sử dụng tool Tune.
    final CollectionFilterTool preToolType = preCloneImage.imageFilterToolLayer.middle.last;
    // Copy list mới tránh side-effect.
    List<FilterTool> filterToolList = List.from(preToolType.filterToolList);

    bool containsType = false;
    // Xử lí theo TuneType
    for (int i = 0; i < filterToolList.length; i++) {
      TuneFilterTool tuneFilter = filterToolList[i] as TuneFilterTool;
      if (tuneFilter.type == state.type) {
        filterToolList[i] = TuneFilterTool(state.type, value);
        containsType = true;
        break;
      }
    }
    if (containsType == false) filterToolList.add(TuneFilterTool(state.type, value));

    // Xử lí CollectionFilterTool mới
    final newMiddleLayer = preCloneImage.imageFilterToolLayer.middle.sublist(
      0,
      preCloneImage.imageFilterToolLayer.middle.length - 1,
    );
    newMiddleLayer.add(CollectionFilterTool(ToolType.tune, filterToolList));

    cloneImage.state = preCloneImage.clone(
      imageFilterToolLayer: preCloneImage.imageFilterToolLayer.copyWith(
        middle: newMiddleLayer,
      ),
    );
  }

  void rerenderImage() {
    // Lấy object cloneImage
    final cloneImage = ref.read(cloneSnapcutImageControllerProvider);
    // Lưu lại trạng thái trước khi thay đổi của cloneImage
    var preCloneImage = cloneImage.state.clone();

    // Check xem đã thêm toolType mới chưa
    if (isInitCloneImage == false) {
      preCloneImage = preCloneImage.clone(
        imageFilterToolLayer: preCloneImage.imageFilterToolLayer.copyWith(
          middle: [
            ...preCloneImage.imageFilterToolLayer.middle,
            const CollectionFilterTool(ToolType.tune, []),
          ],
        ),
      );
      isInitCloneImage = true;
    }

    // Lấy phần CollectionFilterTool đang xử lí trong trường hợp này đang sử dụng tool Tune.
    final CollectionFilterTool preToolType = preCloneImage.imageFilterToolLayer.middle.last;
    // Copy list mới tránh side-effect.
    List<FilterTool> filterToolList = List.from(preToolType.filterToolList);

    bool containsType = false;
    // Xử lí theo TuneType
    for (int i = 0; i < filterToolList.length; i++) {
      TuneFilterTool tuneFilter = filterToolList[i] as TuneFilterTool;
      if (tuneFilter.type == state.type) {
        filterToolList[i] = TuneFilterTool(state.type, state.tuneValue);
        containsType = true;
        break;
      }
    }
    if (containsType == false) filterToolList.add(TuneFilterTool(state.type, state.tuneValue));

    // Xử lí CollectionFilterTool mới
    final newMiddleLayer = preCloneImage.imageFilterToolLayer.middle.sublist(
      0,
      preCloneImage.imageFilterToolLayer.middle.length - 1,
    );
    newMiddleLayer.add(CollectionFilterTool(ToolType.tune, filterToolList));

    cloneImage.state = preCloneImage.clone(
      imageFilterToolLayer: preCloneImage.imageFilterToolLayer.copyWith(
        middle: newMiddleLayer,
      ),
    );
  }

  void updateTune(int value) {
    if (value == state.tuneValue) return;
    switch (state.type) {
      case TuneType.brightness:
        state = TuneValueWithType(state.tune.copyWith(brightness: value), state.type);
        break;
      case TuneType.contrast:
        state = TuneValueWithType(state.tune.copyWith(contrast: value), state.type);
        break;
      case TuneType.saturation:
        state = TuneValueWithType(state.tune.copyWith(saturation: value), state.type);
        break;
      case TuneType.ambiance:
        state = TuneValueWithType(state.tune.copyWith(ambiance: value), state.type);
        break;
      case TuneType.hightlights:
        state = TuneValueWithType(state.tune.copyWith(hightlights: value), state.type);
        break;
      case TuneType.shadows:
        state = TuneValueWithType(state.tune.copyWith(shadows: value), state.type);
        break;
      case TuneType.warmth:
        state = TuneValueWithType(state.tune.copyWith(warmth: value), state.type);
        break;
    }
  }

  void updateTuneWithType(TuneValueWithType tuneWithType) {
    switch (tuneWithType.type) {
      case TuneType.brightness:
        state = TuneValueWithType(state.tune.copyWith(brightness: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.contrast:
        state = TuneValueWithType(state.tune.copyWith(contrast: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.saturation:
        state = TuneValueWithType(state.tune.copyWith(saturation: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.ambiance:
        state = TuneValueWithType(state.tune.copyWith(ambiance: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.hightlights:
        state = TuneValueWithType(state.tune.copyWith(hightlights: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.shadows:
        state = TuneValueWithType(state.tune.copyWith(shadows: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.warmth:
        state = TuneValueWithType(state.tune.copyWith(warmth: tuneWithType.tuneValue), state.type);
        break;
    }

    _updateImage(tuneWithType.tuneValue);
  }

  void updateType(TuneType type) {
    if (type != state.type) state = TuneValueWithType(state.tune, type);
  }
}
