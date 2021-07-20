import 'package:flutter/material.dart';
import 'package:snapcut/src/views/screens/image_editor/components/bottom_tool.dart';
import 'package:snapcut/src/views/screens/image_editor/components/image_view.dart';
import 'package:snapcut/src/views/screens/image_editor/components/top_tool.dart';

class ImageEditorScreen extends StatelessWidget {
  const ImageEditorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        fit: StackFit.expand,
        children: const [
          ImageView(),
          TopTool(),
          BottomTool(),
        ],
      ),
    );
  }
}
