import 'package:app_laundry/core/theme/extensions/app_status_colors.dart';
import 'package:app_laundry/core/theme/tokens/app_colors.dart';
import 'package:flutter/material.dart';

class AppStatusColorsFactory {
  static AppStatusColors light(ColorScheme scheme) {
    return AppStatusColors(
      success: AppColors.success,
      warning: AppColors.warning,
      error: scheme.error,
      info: AppColors.info,

      pending: AppColors.warning,
      process: AppColors.info,
      done: AppColors.success,
      cancel: AppColors.error,
    );
  }

  static AppStatusColors dark(ColorScheme scheme) {
    return AppStatusColors(
      success: AppColors.success,
      warning: AppColors.warning,
      error: scheme.error,
      info: AppColors.info,

      pending: AppColors.warning,
      process: AppColors.info,
      done: AppColors.success,
      cancel: AppColors.error,
    );
  }
}
