import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:snapseed/src/utils/globals.dart';

const double kExportsBoxHeight = 328.0;

class ExportsBox extends HookConsumerWidget {
  const ExportsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: kExportsBoxHeight,
      color: Theme.of(Globals.bodyNav.context).scaffoldBackgroundColor,
    );
  }
}
