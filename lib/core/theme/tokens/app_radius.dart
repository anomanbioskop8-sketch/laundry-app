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

  /// Nilai radius: 0px (Sudut tajam/kotak sempurna)
  final double none = 0.0;

  /// Nilai radius: 4px (Untuk komponen mini seperti checkbox/badge)
  final double xs = 4.0;

  /// Nilai radius: 8px (Untuk komponen kecil seperti tombol kecil/tag)
  final double sm = 8.0;

  /// Nilai radius: 12px (Standar industri untuk Tombol Utama & Card kecil)
  final double md = 12.0;

  /// Nilai radius: 16px (Untuk Card besar, Dialog, atau Bottom Sheet)
  final double lg = 16.0;

  /// Nilai radius: 24px (Untuk container besar atau area profile)
  final double xl = 24.0;

  /// Nilai radius: 999px (Untuk membuat bentuk lingkaran/capsule sempurna)
  final double circular = 999.0;
}
