import 'package:app_laundry/core/theme/tokens/app_colors.dart';
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
    success: AppColors.green600,
    warning: AppColors.amber500,
    error: AppColors.red600,
    info: AppColors.blue600,

    pending: AppColors.amber400,
    process: AppColors.blue500,
    done: AppColors.green500,
    cancel: AppColors.gray500,
  );

  // ✅ Dark Theme
  static const dark = AppStatusColors(
    success: AppColors.green500,
    warning: AppColors.amber400,
    error: AppColors.red500,
    info: AppColors.blue500,

    pending: AppColors.amber400,
    process: AppColors.blue500,
    done: AppColors.green500,
    cancel: AppColors.gray400,
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
