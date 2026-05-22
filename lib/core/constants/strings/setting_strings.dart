// =============================================================================
// File        : setting_strings.dart
// Path        : lib/core/constants/strings/setting_strings.dart
// Layer       : Core (Constants)
// -----------------------------------------------------------------------------
// Fungsi:
// - Kumpulan string untuk feature Setting
// =============================================================================

abstract final class SettingStrings {
  // =========================
  // GENERAL
  // =========================

  static const title = 'Setting';

  static const empty = 'Setting belum tersedia';

  static const updateSuccess = 'Setting berhasil diperbarui';

  // =========================
  // VALIDATION
  // =========================

  static const regularPriceRequired = 'Harga regular wajib diisi';

  static const expressPriceRequired = 'Harga express wajib diisi';

  static const regularEstimationRequired = 'Estimasi regular wajib diisi';

  static const expressEstimationRequired = 'Estimasi express wajib diisi';

  // =========================
  // LABEL
  // =========================

  static const regularPrice = 'Harga Regular';

  static const expressPrice = 'Harga Express';

  static const regularEstimation = 'Estimasi Regular';

  static const expressEstimation = 'Estimasi Express';
}
