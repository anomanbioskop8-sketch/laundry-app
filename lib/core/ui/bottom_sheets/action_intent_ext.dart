import 'package:app_laundry/core/ui/bottom_sheets/action_color_mapper.dart';
import 'package:app_laundry/core/ui/bottom_sheets/action_intent.dart';
import 'package:flutter/material.dart';

extension ActionIntentExt on ActionIntent {
  Color color(BuildContext context) {
    return ActionColorMapper.resolve(context, this);
  }
}
