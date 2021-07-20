import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapseed/src/utils/globals.dart';
import 'package:snapseed/src/utils/styles.dart';
import 'package:snapseed/src/views/screens/image_editor/actions/exports/exports_box.dart';
import 'package:snapseed/src/views/screens/image_editor/actions/tools/tools_box.dart';

final bottomActionStateProvider = StateNotifierProvider<BottomActionState, BottomAction>((ref) => BottomActionState());

enum BottomAction { none, styles, tools, exports }

class BottomActionState extends StateNotifier<BottomAction> {
  BottomActionState() : super(BottomAction.none);

  void show(BottomAction action) {
    switch (action) {
      case BottomAction.styles:
        showStyles();
        break;
      case BottomAction.tools:
        showTools();
        break;
      case BottomAction.exports:
        showExports();
        break;
      default:
    }
  }

  void showStyles() {
    if (state != BottomAction.styles) {
      if (state == BottomAction.tools || state == BottomAction.exports) {
        Navigator.pop(Globals.bodyNav.context);
        Future.delayed(Durations.fastest, () {
          state = BottomAction.styles;
        });
      } else {
        state = BottomAction.styles;
      }
    } else {
      state = BottomAction.none;
    }
  }

  void showTools() {
    if (state != BottomAction.tools) {
      if (state == BottomAction.exports) {
        Navigator.pop(Globals.bodyNav.context);
      }

      showModalBottomSheet(
        context: Globals.bodyNav.context,
        builder: (_) => const ToolsBox(),
      ).then((_) {
        if (state == BottomAction.tools) {
          state = BottomAction.none;
        }
      });
      state = BottomAction.tools;
    } else {
      Navigator.pop(Globals.bodyNav.context);
      state = BottomAction.none;
    }
  }

  void showExports() {
    if (state != BottomAction.exports) {
      if (state == BottomAction.tools) {
        Navigator.pop(Globals.bodyNav.context);
      }
      showModalBottomSheet(
        context: Globals.bodyNav.context,
        builder: (_) => const ExportsBox(),
      ).then((_) {
        if (state == BottomAction.exports) {
          state = BottomAction.none;
        }
      });
      state = BottomAction.exports;
    } else {
      Navigator.pop(Globals.bodyNav.context);
      state = BottomAction.none;
    }
  }
}
