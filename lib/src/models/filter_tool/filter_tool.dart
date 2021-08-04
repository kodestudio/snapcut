import 'dart:async';

import 'package:flutter/widgets.dart';

abstract class FilterTool {
  FutureOr<Widget> filter(Widget child);
}
