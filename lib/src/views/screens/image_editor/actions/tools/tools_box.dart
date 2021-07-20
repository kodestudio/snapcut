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
          children: const [
            ToolGridTile(toolType: ToolType.tune, icon: Icons.tune_outlined, label: 'Chỉnh hình ảnh'),
            ToolGridTile(toolType: ToolType.details, icon: Icons.details_outlined, label: 'Chi tiết'),
            ToolGridTile(toolType: ToolType.curves, icon: Icons.insights_outlined, label: 'Đồ thị màu'),
            ToolGridTile(toolType: ToolType.whiteBalance, icon: Icons.iso_outlined, label: 'Cân bằng trắng'),
            ToolGridTile(toolType: ToolType.crop, icon: Icons.crop_outlined, label: 'Cắt'),
            ToolGridTile(toolType: ToolType.rotate, icon: Icons.rotate_right_outlined, label: 'Xoay'),
            ToolGridTile(toolType: ToolType.tune, icon: Icons.grid_on_outlined, label: 'Phối cảnh'),
            ToolGridTile(toolType: ToolType.expand, icon: Icons.zoom_out_map_outlined, label: 'Mở rộng'),
            ToolGridTile(toolType: ToolType.selective, icon: Icons.adjust_outlined, label: 'Chọn lọc'),
            ToolGridTile(toolType: ToolType.brush, icon: Icons.brush_outlined, label: 'Bút vẽ'),
            ToolGridTile(toolType: ToolType.healing, icon: Icons.healing_outlined, label: 'Chỉnh sửa'),
            ToolGridTile(toolType: ToolType.hdr, icon: Icons.filter_hdr_outlined, label: 'HDR Scape'),
            ToolGridTile(toolType: ToolType.glamourGlow, icon: Icons.shield, label: 'Tỏa sáng huyền ảo'),
            ToolGridTile(toolType: ToolType.tonalContrast, icon: Icons.tonality_outlined, label: 'T.Phản tông màu'),
            ToolGridTile(toolType: ToolType.drama, icon: Icons.filter_drama_outlined, label: 'Kịch tính'),
            ToolGridTile(toolType: ToolType.vintage, icon: Icons.filter_vintage_outlined, label: 'Cổ điển'),
            ToolGridTile(toolType: ToolType.grainyFilms, icon: Icons.grain_outlined, label: 'Phim nhựa'),
            ToolGridTile(toolType: ToolType.retrolux, icon: Icons.theaters_outlined, label: 'Ngược sáng'),
            ToolGridTile(toolType: ToolType.grunge, icon: Icons.camera_roll_outlined, label: 'Grunge'),
            ToolGridTile(toolType: ToolType.blackAndWhite, icon: Icons.filter_b_and_w_outlined, label: 'Đen trắng'),
            ToolGridTile(toolType: ToolType.noir, icon: Icons.ac_unit, label: 'Noir'),
            ToolGridTile(toolType: ToolType.portrait, icon: Icons.face_outlined, label: 'Chân dung'),
            ToolGridTile(toolType: ToolType.headPose, icon: Icons.account_box_outlined, label: 'Tư thế đầu'),
            ToolGridTile(toolType: ToolType.lensBlur, icon: Icons.blur_circular_outlined, label: 'Làm mờ ống kính'),
            ToolGridTile(toolType: ToolType.vignette, icon: Icons.vignette, label: 'Làm mờ nét ảnh'),
            ToolGridTile(toolType: ToolType.doubleExposure, icon: Icons.lens_outlined, label: 'Phơi sáng kép'),
            ToolGridTile(toolType: ToolType.text, icon: Icons.text_fields_outlined, label: 'Văn bản'),
            ToolGridTile(toolType: ToolType.frames, icon: Icons.filter_frames, label: 'Khung'),
          ],
        ),
      ),
    );
  }
}
