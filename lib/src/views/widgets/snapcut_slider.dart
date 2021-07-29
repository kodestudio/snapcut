import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//TODO: implement two side slider
class SnapcutSlider extends HookConsumerWidget {
  const SnapcutSlider({
    Key? key,
    required this.onSlide,
    required this.value,
  }) : super(key: key);

  final Function(int value) onSlide;
  final int value;

  int fromOffsetToValue(double offset, double maxWidth) {
    double halfWidth = maxWidth / 2;
    return ((offset - halfWidth) / halfWidth * 100).toInt();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testOffset = useState<double?>(null);
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.biggest.width, constraints.biggest.height);

        if (testOffset.value == null) {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            testOffset.value = size.width / 2 + value / 100 * size.width;
          });
        }

        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            testOffset.value = details.localPosition.dx - 10;
            onSlide(fromOffsetToValue(details.localPosition.dx, size.width));
          },
          onTapUp: (details) {
            testOffset.value = details.localPosition.dx - 10;
            onSlide(fromOffsetToValue(details.localPosition.dx, size.width));
          },
          child: SizedBox(
            height: 30.0,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 3,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: double.maxFinite,
                    decoration: BoxDecoration(color: Theme.of(context).disabledColor),
                  ),
                ),
                Positioned(
                  left: testOffset.value,
                  top: 0.0,
                  bottom: 0.0,
                  child: Container(
                    height: 10,
                    width: 10,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
