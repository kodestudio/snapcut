import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapcut/src/utils/globals.dart';
import 'package:snapcut/src/utils/router.dart';
import 'package:snapcut/src/utils/styles.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/exports/exports_box.dart';
import 'package:snapcut/src/views/screens/image_editor/actions/tools/tools_box.dart';

final actionStateControllerProvider = StateNotifierProvider<ActionStateController, ActionState>((ref) => ActionStateController());

enum ActionState { none, styles, tools, exports }

class ActionStateController extends StateNotifier<ActionState> {
  ActionStateController() : super(ActionState.none);

  void show(ActionState action) {
    switch (action) {
      case ActionState.styles:
        showStyles();
        break;
      case ActionState.tools:
        showTools();
        break;
      case ActionState.exports:
        showExports();
        break;
      default:
    }
  }

  void showStyles() {
    if (state != ActionState.styles) {
      if (state == ActionState.tools || state == ActionState.exports) {
        SnapcutRouter.pop(Globals.bodyNav.context);
        Future.delayed(Durations.fastest, () {
          state = ActionState.styles;
        });
      } else {
        state = ActionState.styles;
      }
    } else {
      state = ActionState.none;
    }
  }

  void showTools() {
    if (state != ActionState.tools) {
      if (state == ActionState.exports) {
        SnapcutRouter.pop(Globals.bodyNav.context);
      }

      showModalBottomSheet(
        context: Globals.bodyNav.context,
        builder: (_) => const ToolsBox(),
      ).then((_) {
        if (state == ActionState.tools) {
          state = ActionState.none;
        }
      });
      state = ActionState.tools;
    } else {
      SnapcutRouter.pop(Globals.bodyNav.context);
      state = ActionState.none;
    }
  }

  void showExports() {
    if (state != ActionState.exports) {
      if (state == ActionState.tools) {
        SnapcutRouter.pop(Globals.bodyNav.context);
      }
      showModalBottomSheet(
        context: Globals.bodyNav.context,
        builder: (_) => const ExportsBox(),
      ).then((_) {
        if (state == ActionState.exports) {
          state = ActionState.none;
        }
      });
      state = ActionState.exports;
    } else {
      SnapcutRouter.pop(Globals.bodyNav.context);
      state = ActionState.none;
    }
  }
}
