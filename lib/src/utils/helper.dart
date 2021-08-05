import 'package:flutter/widgets.dart';

extension CalculateValue on BoxConstraints {
  double get oneUnit => biggest.width / 200;

  int getDragValue(
    Offset localPosition,
    ValueNotifier<double> initPos,
    ValueNotifier<int> lastValue,
  ) {
    int updateValue = 0;

    int updateUnit = (localPosition.dx - initPos.value) ~/ oneUnit;
    updateValue = lastValue.value + updateUnit;

    if (updateValue < -100) updateValue = -100;
    if (updateValue > 100) updateValue = 100;
    return updateValue;
  }
}
