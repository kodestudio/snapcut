import 'package:flutter/material.dart';
import 'package:snapcut/src/models/filter_tool/filter_tool_type.dart';
import 'package:snapcut/src/models/filter_tool/preset_filter_tool.dart';
import 'package:snapcut/src/models/filter_tool/.filter.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/styles/styled_image.dart';

const double kStylesBox = 112.0;

class StylesBox extends StatelessWidget {
  const StylesBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: kStylesBox,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: presetFilterTools
            .map<Widget>(
              (e) => StyledImage(preset: e),
            )
            .toList(),
      ),
    );
  }
}

List<PresetFilterTool> presetFilterTools = [
  const PresetFilterTool(
    name: 'presets.portrait',
    filterToolType: [
      FilterToolType(ToolType.tune, [
        TuneFilterTool(TuneType.brightness, 70),
        TuneFilterTool(TuneType.ambiance, 70),
        TuneFilterTool(TuneType.contrast, 40),
        TuneFilterTool(TuneType.warmth, 30),
        TuneFilterTool(TuneType.saturation, 50),
      ]),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.smooth',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.pop',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.accenture',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.fadedGlow',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.morning',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.bright',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.fineArt',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.push',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.structure',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
  const PresetFilterTool(
    name: 'presets.silhouette',
    filterToolType: [
      FilterToolType(ToolType.tune, []),
    ],
  ),
];
