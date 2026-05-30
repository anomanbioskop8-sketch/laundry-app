// =============================================================================
// File        : app_semantic_colors.dart
// Path        : lib/core/theme/tokens/app_semantic_colors.dart
// Layer       : Core (Theme Tokens)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan semantic color untuk seluruh aplikasi
// - Memetakan warna berdasarkan makna dan konteks UI
// - Digunakan untuk:
//   - status warna
//   - text color
//   - branding
//   - avatar
//   - feedback UI
// - Membantu menjaga konsistensi design system
// - Menghindari penggunaan warna langsung di widget
// =============================================================================

import 'package:app_laundry/core/theme/tokens/app_palette.dart';

class AppSemanticColors {
  // =========================
  // PRIMARY BRAND
  // =========================

  /// Warna utama brand aplikasi
  static const primary = AppPalette.cyan500;
  static const primaryDark = AppPalette.cyan300;

  // =========================
  // STATUS COLORS
  // =========================

  /// Warna informasi
  static const info = AppPalette.blue500;
  static const infoDark = AppPalette.blue300;

  /// Warna sukses
  static const success = AppPalette.green500;
  static const successDark = AppPalette.green300;

  /// Warna peringatan
  static const warning = AppPalette.orange500;
  static const warningDark = AppPalette.orange300;

  /// Warna error / gagal
  static const error = AppPalette.red500;
  static const errorDark = AppPalette.red300;

  // =========================
  // ORDER STATUS COLORS
  // =========================

  /// Status received
  static const received = AppPalette.blueGrey500;
  static const receivedDark = AppPalette.blueGrey300;

  /// Status in progress
  static const inProgress = AppPalette.orange500;
  static const inProgressDark = AppPalette.orange300;

  /// Status ready
  static const ready = AppPalette.green500;
  static const readyDark = AppPalette.green300;

  static const pickedUp = AppPalette.cyan500;
  static const pickedUpDark = AppPalette.cyan300;

  /// Status dibatalkan
  static const canceled = AppPalette.red500;
  static const canceledDark = AppPalette.red300;

  // =========================
  // TEXT COLORS (LIGHT MODE)
  // =========================

  /// Warna text utama light mode
  static const textPrimaryLight = AppPalette.grey900;

  /// Warna text secondary light mode
  static const textSecondaryLight = AppPalette.grey600;

  // =========================
  // TEXT COLORS (DARK MODE)
  // =========================

  /// Warna text utama dark mode
  static const textPrimaryDark = AppPalette.grey100;

  /// Warna text secondary dark mode
  static const textSecondaryDark = AppPalette.grey400;

  // =========================
  // AVATAR COLORS
  // =========================

  /// Daftar warna avatar random
  static const avatarColors = [
    AppPalette.blue500,
    AppPalette.green500,
    AppPalette.orange500,
    AppPalette.red500,
  ];
}
