import 'package:app_laundry/core/theme/extensions/app_status_colors.dart';
import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';
import 'package:flutter/material.dart';

class AppStatusColorsFactory {
  static AppStatusColors light(ColorScheme scheme) {
    return AppStatusColors(
      success: AppSemanticColors.success,
      warning: AppSemanticColors.warning,
      error: AppSemanticColors.error,
      info: AppSemanticColors.info,

      pending: AppSemanticColors.pending,
      process: AppSemanticColors.process,
      done: AppSemanticColors.done,
      cancel: AppSemanticColors.cancel,
    );
  }

  static AppStatusColors dark(ColorScheme scheme) {
    return AppStatusColors(
      success: AppSemanticColors.success,
      warning: AppSemanticColors.warning,
      error: AppSemanticColors.error,
      info: AppSemanticColors.info,

      pending: AppSemanticColors.pending,
      process: AppSemanticColors.process,
      done: AppSemanticColors.done,
      cancel: AppSemanticColors.cancel,
    );
  }
}
