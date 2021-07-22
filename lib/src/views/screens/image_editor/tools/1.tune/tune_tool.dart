import 'package:flutter/material.dart';
import 'package:snapcut/src/views/screens/image_editor/tools/1.tune/widgets/control_gesture.dart';
import 'package:snapcut/src/views/screens/image_editor/components/edited_image.dart';

import 'widgets/top_tune_tool.dart';
import 'widgets/tune_control_panel.dart';

class TuneTool extends StatelessWidget {
  const TuneTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: Theme.of(context).colorScheme.background,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: const [
              EditedImage(overrideImage: true),
              ControlGesture(),
              TopTuneTool(),
              TuneControlPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
