// =============================================================================
// File        : app_sizes.dart
// Path        : lib/core/theme/tokens/app_sizes.dart
// Layer       : Core (Theme Tokens)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan standard ukuran global aplikasi
// - Menjaga konsistensi ukuran UI di seluruh aplikasi
// - Menyediakan token ukuran untuk:
//   - icon
//   - button
//   - avatar
//   - input
//   - border
// - Menggunakan pendekatan scalable sizing berbasis design system
// =============================================================================

class AppSizes {
  const AppSizes();

  // =========================
  // ICON SIZE
  // =========================
  /// Ukuran icon extra small
  final double iconXs = 12;

  /// Ukuran icon small
  final double iconSm = 16;

  /// Ukuran icon medium
  final double iconMd = 20;

  /// Ukuran icon large
  final double iconLg = 24;

  /// Ukuran icon extra large
  final double iconXl = 32;

  // =========================
  // BUTTON HEIGHT
  // =========================
  /// Tinggi button small
  final double buttonSm = 36;

  /// Tinggi button medium
  final double buttonMd = 44;

  /// Tinggi button large
  final double buttonLg = 56;

  // =========================
  // AVATAR SIZE
  // =========================
  /// Ukuran avatar extra small
  final double avatarXs = 24;

  /// Ukuran avatar small
  final double avatarSm = 40;

  /// Ukuran avatar medium
  final double avatarMd = 64;

  /// Ukuran avatar large
  final double avatarLg = 96;

  /// Ukuran avatar extra large
  final double avatarXl = 120;

  // =========================
  // INPUT
  // =========================
  /// Tinggi standard input field
  final double inputHeight = 48;

  // =========================
  // BORDER WIDTH
  // =========================
  /// Ketebalan border tipis
  final double borderThin = 1;

  /// Ketebalan border tebal
  final double borderThick = 2;
}
