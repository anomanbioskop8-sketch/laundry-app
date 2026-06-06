import 'package:app_laundry/core/ui/bottom_sheet/action_intent.dart';
import 'package:flutter/material.dart';
import 'package:app_laundry/core/theme/extensions/theme_ext.dart';

class ActionColorMapper {
  static Color resolve(BuildContext context, ActionIntent intent) {
    switch (intent) {
      case ActionIntent.create:
        return context.status.success;

      case ActionIntent.update:
        return context.status.success;

      case ActionIntent.delete:
        return context.status.error; // 🔥 merah

      case ActionIntent.view:
        return context.status.info;
    }
  }
}
