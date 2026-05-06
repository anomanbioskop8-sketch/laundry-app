class AppSizes {
  const AppSizes();

  //static const _phi = 1.618;

  // =========================
  // ICON (base: 12)
  // =========================
  final double iconXs = 12; // base
  final double iconSm = 16; // ~12 * φ
  final double iconMd = 20; // adjusted
  final double iconLg = 24; // standard material
  final double iconXl = 32; // ~24 * φ

  // =========================
  // BUTTON HEIGHT (base: 36)
  // =========================
  final double buttonSm = 36; // compact
  final double buttonMd = 44; // ~36 * φ
  final double buttonLg = 56; // ~44 * φ

  // =========================
  // AVATAR (pure golden scaling)
  // =========================
  final double avatarXs = 24; // chip / compact
  final double avatarSm = 40; // list dense (≈ φ)
  final double avatarMd = 64; // ✅ standard list / card
  final double avatarLg = 96; // detail header
  final double avatarXl = 120; // profile (clamped)

  // =========================
  // INPUT
  // =========================
  final double inputHeight = 48; // UX standard (jangan diubah)

  // =========================
  // BORDER WIDTH
  // =========================
  final double borderThin = 1;
  final double borderThick = 2;
}
