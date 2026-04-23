// =============================================================================
// File        : base_state.dart
// Path        : core/base/cubit/base_state.dart
// Layer       : Presentation (State Management - Base)
// -----------------------------------------------------------------------------
// BaseState<T>
//
// Responsibility:
// - Representasi state generic untuk semua Cubit/BLoC.
// - Digunakan untuk mengelola lifecycle UI:
//   initial → loading → success / empty / error
//
// Generic:
// - T = tipe data (single object atau List)
//
// State Flow:
// - BaseInitial  → kondisi awal (idle)
// - BaseLoading  → proses berjalan (API / stream)
// - BaseSuccess  → data berhasil didapat
// - BaseEmpty    → data kosong (khusus list)
// - BaseError    → terjadi error
//
// Notes:
// - Gunakan BaseEmpty hanya untuk tipe List.
// - Gunakan BaseSuccess untuk semua data (single / list).
// - Semua state immutable (const constructor).
// =============================================================================

/// 🔹 Base abstract state
abstract class BaseState<T> {
  const BaseState();
}

// ============================================================================
// INITIAL STATE
// ============================================================================

/// 💤 State awal (belum ada proses)
class BaseInitial<T> extends BaseState<T> {
  const BaseInitial();
}

// ============================================================================
// LOADING STATE
// ============================================================================

/// ⏳ State saat proses berjalan (API / stream / computation)
class BaseLoading<T> extends BaseState<T> {
  const BaseLoading();
}

// ============================================================================
// SUCCESS STATE
// ============================================================================

/// ✅ State ketika data berhasil didapat
///
/// [data] bisa berupa:
/// - Object (CustomerEntity, OrderEntity, dll)
/// - List<T>
class BaseSuccess<T> extends BaseState<T> {
  final T data;

  const BaseSuccess(this.data);
}

// ============================================================================
// EMPTY STATE
// ============================================================================

/// 📭 State ketika data kosong
///
/// ⚠️ Direkomendasikan hanya untuk List:
/// contoh: List<CustomerEntity>
class BaseEmpty<T> extends BaseState<T> {
  const BaseEmpty();
}

// ============================================================================
// ERROR STATE
// ============================================================================

/// ❌ State ketika terjadi error
///
/// [message] berisi pesan error untuk UI (snackbar / text)
class BaseError<T> extends BaseState<T> {
  final String message;

  const BaseError(this.message);
}
