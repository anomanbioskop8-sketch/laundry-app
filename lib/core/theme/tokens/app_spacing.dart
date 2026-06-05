// =============================================================================
// File        : app_spacing.dart
// Path        : lib/core/theme/tokens/app_spacing.dart
// Layer       : Core (Theme Tokens)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan standard spacing global aplikasi
// - Menjaga konsistensi jarak antar komponen UI
// - Digunakan untuk:
//   - padding
//   - margin
//   - gap
//   - section spacing
//   - layout spacing
// - Menjadi bagian dari design system aplikasi
// =============================================================================

class AppSpacing {
  const AppSpacing();

  // =========================
  // EXTRA SMALL SPACING
  // =========================
  /// Jarak sangat kecil untuk elemen compact
  final double xs = 4;

  // =========================
  // SMALL SPACING
  // =========================
  /// Jarak kecil antar elemen
  final double sm = 8;

  // =========================
  // MEDIUM SPACING
  // =========================
  /// Jarak standard antar komponen
  final double md = 16;

  // =========================
  // LARGE SPACING
  // =========================
  /// Jarak besar untuk section ringan
  final double lg = 24;

  // =========================
  // EXTRA LARGE SPACING
  // =========================
  /// Jarak extra besar antar section
  final double xl = 32;

  // =========================
  // EXTRA EXTRA LARGE SPACING
  // =========================
  /// Jarak sangat besar untuk layout utama
  final double xxl = 40;

  // =========================
  // EXTRA EXTRA EXTRA LARGE SPACING
  // =========================
  /// Jarak maksimal untuk layout luas
  final double xxxl = 48;
}
