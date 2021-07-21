import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapcut/src/models/filter_tool/tool_type.dart';
import 'package:snapcut/src/utils/globals.dart';
import 'package:snapcut/src/utils/styles.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/tools/tool_grid_tile.dart';

const double kToolsBoxHeight = 497.0;

@immutable
class ToolsBox extends HookConsumerWidget {
  const ToolsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      clipBehavior: Clip.none,
      height: kToolsBoxHeight,
      color: Theme.of(Globals.bodyNav.context).scaffoldBackgroundColor,
      child: ScrollbarTheme(
        data: ScrollbarThemeData(
          crossAxisMargin: 0.0,
          radius: const Radius.circular(0.0),
          showTrackOnHover: false,
          mainAxisMargin: 0.0,
          minThumbLength: 5,
          trackColor: MaterialStateProperty.all(Colors.amber),
          thumbColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: GridView.extent(
          maxCrossAxisExtent: 90,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          padding: const EdgeInsets.only(top: Insets.m),
          childAspectRatio: 72 / 80,
          clipBehavior: Clip.none,
          children: const [
            ToolGridTile(toolType: ToolType.tune, icon: Icons.tune_outlined, label: 'imageEditor.tools.tune'),
            ToolGridTile(toolType: ToolType.details, icon: Icons.details_outlined, label: 'imageEditor.tools.details'),
            ToolGridTile(toolType: ToolType.curves, icon: Icons.insights_outlined, label: 'imageEditor.tools.curves'),
            ToolGridTile(toolType: ToolType.whiteBalance, icon: Icons.iso_outlined, label: 'imageEditor.tools.whiteBalance'),
            ToolGridTile(toolType: ToolType.crop, icon: Icons.crop_outlined, label: 'imageEditor.tools.crop'),
            ToolGridTile(toolType: ToolType.rotate, icon: Icons.rotate_right_outlined, label: 'imageEditor.tools.rotate'),
            ToolGridTile(toolType: ToolType.tune, icon: Icons.grid_on_outlined, label: 'imageEditor.tools.perspective'),
            ToolGridTile(toolType: ToolType.expand, icon: Icons.zoom_out_map_outlined, label: 'imageEditor.tools.expand'),
            ToolGridTile(toolType: ToolType.selective, icon: Icons.adjust_outlined, label: 'imageEditor.tools.selective'),
            ToolGridTile(toolType: ToolType.brush, icon: Icons.brush_outlined, label: 'imageEditor.tools.brush'),
            ToolGridTile(toolType: ToolType.healing, icon: Icons.healing_outlined, label: 'imageEditor.tools.healing'),
            ToolGridTile(toolType: ToolType.hdr, icon: Icons.filter_hdr_outlined, label: 'imageEditor.tools.hdr'),
            ToolGridTile(toolType: ToolType.glamourGlow, icon: Icons.shield, label: 'imageEditor.tools.glamourGlow'),
            ToolGridTile(toolType: ToolType.tonalContrast, icon: Icons.tonality_outlined, label: 'imageEditor.tools.tonalContrast'),
            ToolGridTile(toolType: ToolType.drama, icon: Icons.filter_drama_outlined, label: 'imageEditor.tools.drama'),
            ToolGridTile(toolType: ToolType.vintage, icon: Icons.filter_vintage_outlined, label: 'imageEditor.tools.vintage'),
            ToolGridTile(toolType: ToolType.grainyFilms, icon: Icons.grain_outlined, label: 'imageEditor.tools.grainyFilms'),
            ToolGridTile(toolType: ToolType.retrolux, icon: Icons.theaters_outlined, label: 'imageEditor.tools.retrolux'),
            ToolGridTile(toolType: ToolType.grunge, icon: Icons.camera_roll_outlined, label: 'imageEditor.tools.grunge'),
            ToolGridTile(toolType: ToolType.blackAndWhite, icon: Icons.filter_b_and_w_outlined, label: 'imageEditor.tools.blackAndWhite'),
            ToolGridTile(toolType: ToolType.noir, icon: Icons.ac_unit, label: 'imageEditor.tools.noir'),
            ToolGridTile(toolType: ToolType.portrait, icon: Icons.face_outlined, label: 'imageEditor.tools.portrait'),
            ToolGridTile(toolType: ToolType.headPose, icon: Icons.account_box_outlined, label: 'imageEditor.tools.headPose'),
            ToolGridTile(toolType: ToolType.lensBlur, icon: Icons.blur_circular_outlined, label: 'imageEditor.tools.lensBlur'),
            ToolGridTile(toolType: ToolType.vignette, icon: Icons.vignette, label: 'imageEditor.tools.vignette'),
            ToolGridTile(toolType: ToolType.doubleExposure, icon: Icons.lens_outlined, label: 'imageEditor.tools.doubleExposure'),
            ToolGridTile(toolType: ToolType.text, icon: Icons.text_fields_outlined, label: 'imageEditor.tools.text'),
            ToolGridTile(toolType: ToolType.frames, icon: Icons.filter_frames, label: 'imageEditor.tools.frames'),
          ],
        ),
      ),
    );
  }
}
