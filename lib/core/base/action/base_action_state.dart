// =============================================================================
// File        : base_action_state.dart
// Path        : core/base/action/base_action_state.dart
// Layer       : Presentation (State Management - Base)
// -----------------------------------------------------------------------------
// BaseActionState
//
// Responsibility:
// - Merepresentasikan state dari proses action:
//   - Initial  → kondisi awal
//   - Loading  → proses berjalan
//   - Success  → berhasil
//   - Error    → gagal
//
// Usage:
// - Digunakan oleh BaseActionCubit dan turunannya.
// - Mengontrol UI feedback (loading, snackbar, dll).
//
// Notes:
// - State bersifat immutable.
// - Bisa di-upgrade ke Freezed untuk pattern lebih advanced.
// =============================================================================

/// Base abstract state untuk semua action
abstract class BaseActionState {
  const BaseActionState();
}

// ============================================================================
// INITIAL STATE
// ----------------------------------------------------------------------------
// Kondisi awal sebelum action dijalankan
// ============================================================================

class ActionInitial extends BaseActionState {
  const ActionInitial();
}

// ============================================================================
// LOADING STATE
// ----------------------------------------------------------------------------
// Menandakan proses sedang berjalan
// ============================================================================

class ActionLoading extends BaseActionState {
  const ActionLoading();
}

// ============================================================================
// SUCCESS STATE
// ----------------------------------------------------------------------------
// Menandakan action berhasil
//
// Parameter:
// - message → pesan sukses (untuk UI / snackbar)
// ============================================================================

class ActionSuccess extends BaseActionState {
  final String message;

  const ActionSuccess(this.message);
}

// ============================================================================
// ERROR STATE
// ----------------------------------------------------------------------------
// Menandakan action gagal
//
// Parameter:
// - message → pesan error (untuk UI / snackbar)
// ============================================================================

class ActionError extends BaseActionState {
  final String message;

  const ActionError(this.message);
}
