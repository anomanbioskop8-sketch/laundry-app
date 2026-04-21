import 'package:flutter/material.dart';
import 'app_palette.dart';

class AppColorScheme {
  static final ColorScheme light = ColorScheme.fromSeed(
    seedColor: AppPalette.seed,
    brightness: Brightness.light,
  ).copyWith(
    error: AppPalette.error, // override biar konsisten brand
  );

  static final ColorScheme dark = ColorScheme.fromSeed(
    seedColor: AppPalette.seed,
    brightness: Brightness.dark,
  ).copyWith(
    error: AppPalette.error,
  );
}