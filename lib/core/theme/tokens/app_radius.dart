// =============================================================================
// File        : app_radius.dart
// Path        : lib/core/theme/tokens/app_radius.dart
// Layer       : Core (Theme Tokens)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan standard radius global aplikasi
// - Menjaga konsistensi border radius di seluruh UI
// - Digunakan untuk:
//   - card
//   - button
//   - dialog
//   - bottom sheet
//   - input field
//   - avatar dan component lainnya
// - Menjadi bagian dari design system aplikasi
// =============================================================================

class AppRadius {
  AppRadius();

  // =========================
  // SMALL RADIUS
  // =========================
  /// Radius kecil untuk komponen compact
  final double sm = 6.0;

  // =========================
  // MEDIUM RADIUS
  // =========================
  /// Radius standard untuk sebagian besar komponen
  final double md = 10.0;

  // =========================
  // LARGE RADIUS
  // =========================
  /// Radius besar untuk card dan dialog
  final double lg = 16.0;

  // =========================
  // EXTRA LARGE RADIUS
  // =========================
  /// Radius extra besar untuk container modern UI
  final double xl = 24.0;

  // =========================
  // EXTRA EXTRA LARGE RADIUS
  // =========================
  /// Radius maksimal untuk layout premium / rounded UI
  final double xxl = 32.0;
}
