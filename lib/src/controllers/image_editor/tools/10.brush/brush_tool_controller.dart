import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapcut/src/controllers/snapcut_image/clone_snapcut_image_controller.dart';
import 'package:snapcut/src/models/filter_tool/collection_filter_tool.dart';
import 'package:snapcut/src/models/filter_tool/custom_filter_tool/brush_filter_tool.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool.dart';
import 'package:snapcut/src/models/filter_tool/tool_type.dart';

final brushToolControllerProvider = StateNotifierProvider.autoDispose<BrushToolController, BrushInfo>(
  (ref) => BrushToolController(ref.read, brushInfo: const BrushInfo()),
);

final currentBrushTypeProvider = StateProvider.autoDispose<BrushTypeAndLevel>((ref) => const BrushTypeAndLevel(BrushType.dodgeAndBurn, BrushLevel.remove));

class BrushTypeAndLevel {
  final BrushType type;
  final BrushLevel level;

  const BrushTypeAndLevel(this.type, this.level);
}

class BrushInfo {
  final BrushFilterTool? dodgeAndBurn;
  final BrushFilterTool? exposure;
  final BrushFilterTool? temperature;
  final BrushFilterTool? saturation;

  const BrushInfo({
    this.dodgeAndBurn,
    this.exposure,
    this.temperature,
    this.saturation,
  });

  BrushInfo copyWith({
    BrushFilterTool? dodgeAndBurn,
    BrushFilterTool? exposure,
    BrushFilterTool? temperature,
    BrushFilterTool? saturation,
  }) =>
      BrushInfo(
        dodgeAndBurn: dodgeAndBurn ?? this.dodgeAndBurn,
        exposure: exposure ?? this.exposure,
        saturation: saturation ?? this.saturation,
        temperature: temperature ?? this.temperature,
      );

  List<BrushFilterTool?> get filterList => [dodgeAndBurn, exposure, temperature, saturation];
}

class BrushToolController extends StateController<BrushInfo> {
  BrushToolController(this._read, {required BrushInfo brushInfo}) : super(brushInfo);

  final Reader _read;

  bool isInitImage = false;

  void rerenderImage() {
    final cloneImage = _read(cloneSnapcutImageControllerProvider);

    List<CollectionFilterTool> middleLayer = cloneImage.state.imageFilterToolLayer.middle;
    CollectionFilterTool currentTool;

    if (isInitImage == false) {
      currentTool = const CollectionFilterTool(ToolType.brush, []);

      for (var filter in state.filterList) {
        if (filter != null) {
          currentTool = currentTool.addFilter(filter);
        }
      }

      isInitImage = true;
      cloneImage.state = cloneImage.state.addCollectionInMiddleLayer(currentTool);
    } else {
      currentTool = middleLayer.last;
      for (var filter in state.filterList) {
        if (filter != null) {
          List<FilterTool> newFilterToolList = List.from(currentTool.filterToolList);
          int index = newFilterToolList.indexWhere((oldFilter) {
            if (oldFilter is BrushFilterTool) {
              return oldFilter.brushType == filter.brushType;
            }
            return false;
          });
          if (index != -1) {
            newFilterToolList[index] = filter;
          } else {
            newFilterToolList.add(filter);
          }
          currentTool = currentTool.replaceFilters(newFilterToolList);
        }
      }

      cloneImage.state = cloneImage.state.replaceLastCollectionInMiddleLayer(currentTool);
    }
  }

  void updateInfo(
    BrushType type, {
    required Offset offset,
    required BrushLevel level,
  }) {
    switch (type) {
      case BrushType.dodgeAndBurn:
        int index = -1;
        if (state.dodgeAndBurn != null) {
          index = state.dodgeAndBurn!.points.indexWhere((point) {
            return point.level == level && point.point.dx == offset.dx && point.point.dy == offset.dy;
          });
        }
        if (index == -1) _updateDodgeAndBurn(offset, level);
        break;
      case BrushType.exposure:
        _updateExposure(offset, level);
        break;
      case BrushType.saturation:
        _updateSaturation(offset, level);
        break;
      case BrushType.temperature:
        _updateTemperature(offset, level);
        break;
    }
  }

  void _updateDodgeAndBurn(Offset offset, BrushLevel level) {
    if (state.dodgeAndBurn == null) {
      state = state.copyWith(
        dodgeAndBurn: BrushFilterTool(
          brushType: BrushType.dodgeAndBurn,
          points: [offset.toPoint(level)],
        ),
      );
    } else {
      state = state.copyWith(dodgeAndBurn: state.dodgeAndBurn!.addPoint(offset.toPoint(level)));
    }
  }

  void _updateExposure(Offset offset, BrushLevel level) {
    if (state.exposure == null) {
      state = state.copyWith(
        exposure: BrushFilterTool(
          brushType: BrushType.exposure,
          points: [offset.toPoint(level)],
        ),
      );
    } else {
      state = state.copyWith(exposure: state.exposure!.addPoint(offset.toPoint(level)));
    }
  }

  void _updateSaturation(Offset offset, BrushLevel level) {
    if (state.saturation == null) {
      state = state.copyWith(
        saturation: BrushFilterTool(
          brushType: BrushType.saturation,
          points: [offset.toPoint(level)],
        ),
      );
    } else {
      state = state.copyWith(saturation: state.saturation!.addPoint(offset.toPoint(level)));
    }
  }

  void _updateTemperature(Offset offset, BrushLevel level) {
    if (state.temperature == null) {
      state = state.copyWith(
        temperature: BrushFilterTool(
          brushType: BrushType.temperature,
          points: [offset.toPoint(level)],
        ),
      );
    } else {
      state = state.copyWith(temperature: state.temperature!.addPoint(offset.toPoint(level)));
    }
  }
}
