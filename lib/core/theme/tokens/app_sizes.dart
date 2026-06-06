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
  final double iconMd = 24;

  /// Ukuran icon large
  final double iconLg = 32;

  /// Ukuran icon extra large
  final double iconXl = 40;

  /// Ukuran icon extra extra large
  final double iconXxl = 48;

  // =========================
  // BUTTON HEIGHT
  // =========================
  /// Tinggi button small
  final double buttonSm = 32;

  /// Tinggi button medium
  final double buttonMd = 40;

  /// Tinggi button large
  final double buttonLg = 48;

  /// Tinggi button extra large
  final double buttonXl = 56;

  /// Tinggi button extra extra large
  final double buttonXxl = 64;

  // =========================
  // AVATAR SIZE
  // =========================
  /// Ukuran avatar extra small
  final double avatarXs = 24;

  /// Ukuran avatar small
  final double avatarSm = 32;

  /// Ukuran avatar medium
  final double avatarMd = 40;

  /// Ukuran avatar large
  final double avatarLg = 48;

  /// Ukuran avatar extra large
  final double avatarXl = 56;

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
