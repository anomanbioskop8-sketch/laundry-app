import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';
import 'package:flutter/material.dart';

class AppStatusColors extends ThemeExtension<AppStatusColors> {
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  final Color received;
  final Color inProgress;
  final Color ready;
  final Color pickedUp;
  final Color canceled;

  const AppStatusColors({
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.received,
    required this.inProgress,
    required this.ready,
    required this.pickedUp,
    required this.canceled,
  });

  // ✅ Light Theme
  static const light = AppStatusColors(
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

  // ✅ Dark Theme
  static const dark = AppStatusColors(
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

  // ✅ Fallback (anti crash)
  factory AppStatusColors.fallback() => light;

  @override
  AppStatusColors copyWith({
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? received,
    Color? inProgress,
    Color? ready,
    Color? pickedUp,
    Color? canceled,
  }) {
    return AppStatusColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      received: received ?? this.received,
      inProgress: inProgress ?? this.inProgress,
      ready: ready ?? this.ready,
      pickedUp: pickedUp ?? this.pickedUp,
      canceled: canceled ?? this.canceled,
    );
  }

  @override
  AppStatusColors lerp(ThemeExtension<AppStatusColors>? other, double t) {
    if (other is! AppStatusColors) return this;

    return AppStatusColors(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      received: Color.lerp(received, other.received, t)!,
      inProgress: Color.lerp(inProgress, other.inProgress, t)!,
      ready: Color.lerp(ready, other.ready, t)!,
      pickedUp: Color.lerp(pickedUp, other.pickedUp, t)!,
      canceled: Color.lerp(canceled, other.canceled, t)!,
    );
  }
}
