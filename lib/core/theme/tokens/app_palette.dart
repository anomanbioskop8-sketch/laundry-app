// =============================================================================
// File        : app_palette.dart
// Path        : lib/core/theme/tokens/app_palette.dart
// Layer       : Core (Theme Tokens)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan kumpulan warna dasar aplikasi
// - Menjadi source utama untuk design system color token
// - Digunakan oleh:
//   - AppColors
//   - ThemeData
//   - Semantic colors
//   - Component styling
// - Menjaga konsistensi warna di seluruh aplikasi
// =============================================================================

import 'package:flutter/material.dart';

class AppPalette {
  // =========================
  // LIGHT
  // =========================

  static const cyan500 = Color(0xFF00BCD4);
  static const blue500 = Color(0xFF2196F3);
  static const green500 = Color(0xFF4CAF50);
  static const orange500 = Color(0xFFFF9800);
  static const red500 = Color(0xFFF44336);
  static const blueGrey500 = Color(0xFF607D8B);
  static const grey900 = Color(0xFF212121);
  static const grey600 = Color(0xFF757575);

  // =========================
  // DARK
  // =========================

  static const cyan300 = Color(0xFF4DD0E1); // cyan300
  static const blue300 = Color(0xFF64B5F6); // blue300
  static const green300 = Color(0xFF81C784); // green300
  static const orange300 = Color(0xFFFFB74D); // orange300
  static const red300 = Color(0xFFE57373); // red300
  static const blueGrey300 = Color(0xFF90A4AE);
  static const grey400 = Color(0xFFBDBDBD);
  static const grey100 = Color(0xFFF5F5F5);
}
