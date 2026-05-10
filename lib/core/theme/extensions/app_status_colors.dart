import 'package:app_laundry/core/theme/tokens/app_semantic_colors.dart';
import 'package:flutter/material.dart';

class AppStatusColors extends ThemeExtension<AppStatusColors> {
  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  final Color pending;
  final Color process;
  final Color done;
  final Color cancel;

  const AppStatusColors({
    required this.success,
    required this.warning,
    required this.error,
    required this.info,
    required this.pending,
    required this.process,
    required this.done,
    required this.cancel,
  });

  // ✅ Light Theme
  static const light = AppStatusColors(
    success: AppSemanticColors.success,
    warning: AppSemanticColors.warning,
    error: AppSemanticColors.error,
    info: AppSemanticColors.info,

    pending: AppSemanticColors.pending,
    process: AppSemanticColors.process,
    done: AppSemanticColors.done,
    cancel: AppSemanticColors.cancel,
  );

  // ✅ Dark Theme
  static const dark = AppStatusColors(
    success: AppSemanticColors.success,
    warning: AppSemanticColors.warning,
    error: AppSemanticColors.error,
    info: AppSemanticColors.info,

    pending: AppSemanticColors.pending,
    process: AppSemanticColors.process,
    done: AppSemanticColors.done,
    cancel: AppSemanticColors.cancel,
  );

  // ✅ Fallback (anti crash)
  factory AppStatusColors.fallback() => light;

  @override
  AppStatusColors copyWith({
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? pending,
    Color? process,
    Color? done,
    Color? cancel,
  }) {
    return AppStatusColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      pending: pending ?? this.pending,
      process: process ?? this.process,
      done: done ?? this.done,
      cancel: cancel ?? this.cancel,
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
      pending: Color.lerp(pending, other.pending, t)!,
      process: Color.lerp(process, other.process, t)!,
      done: Color.lerp(done, other.done, t)!,
      cancel: Color.lerp(cancel, other.cancel, t)!,
    );
  }
}
