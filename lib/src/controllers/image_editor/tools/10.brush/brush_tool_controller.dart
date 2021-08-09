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
  final bool onDraw;
  final BrushType currentType;
  final BrushFilterTool? dodgeAndBurn;
  final BrushFilterTool? exposure;
  final BrushFilterTool? temperature;
  final BrushFilterTool? saturation;

  const BrushInfo({
    this.onDraw = false,
    this.currentType = BrushType.dodgeAndBurn,
    this.dodgeAndBurn,
    this.exposure,
    this.temperature,
    this.saturation,
  });

  BrushInfo copyWith({
    BrushType? currentType,
    bool? onDraw,
    BrushFilterTool? dodgeAndBurn,
    BrushFilterTool? exposure,
    BrushFilterTool? temperature,
    BrushFilterTool? saturation,
  }) =>
      BrushInfo(
        currentType: currentType ?? this.currentType,
        onDraw: onDraw ?? this.onDraw,
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

  List<Point> _cachePoint = [];

  void setOnDraw(bool value) {
    state = state.copyWith(onDraw: value);
  }

  void setCurrentBrushType(BrushType type) {
    state = state.copyWith(currentType: type);
  }

  void undo() {
    switch (state.currentType) {
      case BrushType.dodgeAndBurn:
        if (state.dodgeAndBurn != null) {
          if (state.dodgeAndBurn!.points.isNotEmpty) {
            List<BrushPoints> points = List.from(state.dodgeAndBurn!.points);
            points.removeLast();
            final dodgeAndBurn = BrushFilterTool(
              brushType: state.currentType,
              points: points,
            );

            state = state.copyWith(dodgeAndBurn: dodgeAndBurn);
            rerenderImage();
          }
        }
        break;
      case BrushType.exposure:
        if (state.exposure != null) {
          if (state.exposure!.points.isNotEmpty) {
            List<BrushPoints> points = List.from(state.exposure!.points);
            points.removeLast();
            final exposure = BrushFilterTool(
              brushType: state.currentType,
              points: points,
            );

            state = state.copyWith(exposure: exposure);
            rerenderImage();
          }
        }
        break;
      case BrushType.saturation:
        if (state.saturation != null) {
          if (state.saturation!.points.isNotEmpty) {
            List<BrushPoints> points = List.from(state.saturation!.points);
            points.removeLast();
            final saturation = BrushFilterTool(
              brushType: state.currentType,
              points: points,
            );

            state = state.copyWith(saturation: saturation);
            rerenderImage();
          }
        }
        break;
      case BrushType.temperature:
        if (state.temperature != null) {
          if (state.temperature!.points.isNotEmpty) {
            List<BrushPoints> points = List.from(state.temperature!.points);
            points.removeLast();
            final temperature = BrushFilterTool(
              brushType: state.currentType,
              points: points,
            );

            state = state.copyWith(temperature: temperature);
            rerenderImage();
          }
        }
        break;
      default:
    }
  }

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
        _updateDodgeAndBurn(offset, level);
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
    /// When is not draw yet so newPoints should be empty
    if (state.onDraw == false) {
      _cachePoint = [];
      _cachePoint.add(offset.toPoint());
      var newPoints = <BrushPoints>[];
      if (state.dodgeAndBurn != null) {
        newPoints = List.from(state.dodgeAndBurn!.points);
      }
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(
        onDraw: true,
        dodgeAndBurn: BrushFilterTool(brushType: BrushType.dodgeAndBurn, points: newPoints),
      );
    } else {
      _cachePoint.add(offset.toPoint());
      List<BrushPoints> newPoints = List.from(state.dodgeAndBurn!.points);
      newPoints.removeLast();
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(dodgeAndBurn: BrushFilterTool(brushType: BrushType.dodgeAndBurn, points: newPoints));
    }
  }

  void _updateExposure(Offset offset, BrushLevel level) {
    if (state.onDraw == false) {
      _cachePoint = [];
      _cachePoint.add(offset.toPoint());
      var newPoints = <BrushPoints>[];
      if (state.exposure != null) {
        newPoints = List.from(state.exposure!.points);
      }
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(
        onDraw: true,
        exposure: BrushFilterTool(brushType: BrushType.exposure, points: newPoints),
      );
    } else {
      _cachePoint.add(offset.toPoint());
      List<BrushPoints> newPoints = List.from(state.exposure!.points);
      newPoints.removeLast();
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(exposure: BrushFilterTool(brushType: BrushType.exposure, points: newPoints));
    }
  }

  void _updateSaturation(Offset offset, BrushLevel level) {
    if (state.onDraw == false) {
      _cachePoint = [];
      _cachePoint.add(offset.toPoint());
      var newPoints = <BrushPoints>[];
      if (state.saturation != null) {
        newPoints = List.from(state.saturation!.points);
      }
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(
        onDraw: true,
        saturation: BrushFilterTool(brushType: BrushType.saturation, points: newPoints),
      );
    } else {
      _cachePoint.add(offset.toPoint());
      List<BrushPoints> newPoints = List.from(state.saturation!.points);
      newPoints.removeLast();
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(saturation: BrushFilterTool(brushType: BrushType.saturation, points: newPoints));
    }
  }

  void _updateTemperature(Offset offset, BrushLevel level) {
    if (state.onDraw == false) {
      _cachePoint = [];
      _cachePoint.add(offset.toPoint());
      var newPoints = <BrushPoints>[];
      if (state.temperature != null) {
        newPoints = List.from(state.temperature!.points);
      }
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(
        onDraw: true,
        temperature: BrushFilterTool(brushType: BrushType.temperature, points: newPoints),
      );
    } else {
      _cachePoint.add(offset.toPoint());
      List<BrushPoints> newPoints = List.from(state.temperature!.points);
      newPoints.removeLast();
      newPoints.add(BrushPoints(_cachePoint, level));
      state = state.copyWith(temperature: BrushFilterTool(brushType: BrushType.temperature, points: newPoints));
    }
  }
}
