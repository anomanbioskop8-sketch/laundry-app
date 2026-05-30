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

      received: AppSemanticColors.received,
      inProgress: AppSemanticColors.inProgress,
      ready: AppSemanticColors.ready,
      pickedUp: AppSemanticColors.pickedUp,
      canceled: AppSemanticColors.canceled,
    );
  }

  static AppStatusColors dark(ColorScheme scheme) {
    return AppStatusColors(
      success: AppSemanticColors.successDark,
      warning: AppSemanticColors.warningDark,
      error: AppSemanticColors.errorDark,
      info: AppSemanticColors.infoDark,

      received: AppSemanticColors.receivedDark,
      inProgress: AppSemanticColors.inProgressDark,
      ready: AppSemanticColors.readyDark,
      pickedUp: AppSemanticColors.pickedUpDark,
      canceled: AppSemanticColors.canceledDark,
    );
  }
}
