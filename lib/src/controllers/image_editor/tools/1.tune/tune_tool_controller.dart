//ignore_for_file:prefer_final_fields
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/models/filter_tool/.filter.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:snapcut/src/models/image_editor/1.tune/tune_type.dart';

final tuneToolControllerProvider = StateNotifierProvider.autoDispose<TuneToolController, TuneWithType>((ref) => TuneToolController(ref));

class TuneWithType {
  const TuneWithType(this.tune, this.type);

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

  TuneWithType update(TuneType type, int value) {
    switch (type) {
      case TuneType.brightness:
        return TuneWithType(tune.copyWith(brightness: value), type);
      case TuneType.contrast:
        return TuneWithType(tune.copyWith(contrast: value), type);
      case TuneType.saturation:
        return TuneWithType(tune.copyWith(saturation: value), type);
      case TuneType.ambiance:
        return TuneWithType(tune.copyWith(ambiance: value), type);
      case TuneType.hightlights:
        return TuneWithType(tune.copyWith(hightlights: value), type);
      case TuneType.shadows:
        return TuneWithType(tune.copyWith(shadows: value), type);
      case TuneType.warmth:
        return TuneWithType(tune.copyWith(warmth: value), type);
    }
  }
}

class TuneToolController extends StateNotifier<TuneWithType> {
  TuneToolController(this.ref) : super(const TuneWithType(Tune.defaultValue, TuneType.brightness));

  final ProviderRefBase ref;

  bool isInitCloneImage = false;

  void updateImage(int value) {
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

  void updateTune(int value) {
    switch (state.type) {
      case TuneType.brightness:
        state = TuneWithType(state.tune.copyWith(brightness: value), state.type);
        break;
      case TuneType.contrast:
        state = TuneWithType(state.tune.copyWith(contrast: value), state.type);
        break;
      case TuneType.saturation:
        state = TuneWithType(state.tune.copyWith(saturation: value), state.type);
        break;
      case TuneType.ambiance:
        state = TuneWithType(state.tune.copyWith(ambiance: value), state.type);
        break;
      case TuneType.hightlights:
        state = TuneWithType(state.tune.copyWith(hightlights: value), state.type);
        break;
      case TuneType.shadows:
        state = TuneWithType(state.tune.copyWith(shadows: value), state.type);
        break;
      case TuneType.warmth:
        state = TuneWithType(state.tune.copyWith(warmth: value), state.type);
        break;
    }

    updateImage(value);
  }

  void updateTuneWithType(TuneWithType tuneWithType) {
    switch (tuneWithType.type) {
      case TuneType.brightness:
        state = TuneWithType(state.tune.copyWith(brightness: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.contrast:
        state = TuneWithType(state.tune.copyWith(contrast: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.saturation:
        state = TuneWithType(state.tune.copyWith(saturation: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.ambiance:
        state = TuneWithType(state.tune.copyWith(ambiance: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.hightlights:
        state = TuneWithType(state.tune.copyWith(hightlights: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.shadows:
        state = TuneWithType(state.tune.copyWith(shadows: tuneWithType.tuneValue), state.type);
        break;
      case TuneType.warmth:
        state = TuneWithType(state.tune.copyWith(warmth: tuneWithType.tuneValue), state.type);
        break;
    }

    updateImage(tuneWithType.tuneValue);
  }

  void updateType(TuneType value) {
    if (value != state.type) state = TuneWithType(state.tune, value);
  }
}
