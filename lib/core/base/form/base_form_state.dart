// =============================================================================
// File        : base_form_state.dart
// Path        : core/base/form/base_form_state.dart
// Layer       : Presentation (State Management - Form)
// -----------------------------------------------------------------------------
// BaseFormState
//
// Responsibility:
// - Menyimpan seluruh state form secara immutable.
// - Digunakan oleh BaseFormCubit untuk mengelola:
//   - field values
//   - validation errors
//   - loading state
//   - message (success / error)
//
// Structure:
// - fields   : menyimpan value form (dynamic, berbasis key)
// - errors   : menyimpan error tiap field (nullable)
// - isLoading: status submit proses
// - message  : pesan global (success / error)
//
// Notes:
// - Gunakan key yang konsisten (name, phone, dll).
// - State harus immutable → gunakan copyWith() untuk update.
// - errors[key] == null → field valid
// =============================================================================

class BaseFormState {
  /// 🧾 Menyimpan nilai field form
  ///
  /// Example:
  /// { "name": "John", "phone": "08123" }
  final Map<String, dynamic> fields;

  /// ⚠️ Menyimpan error per field
  ///
  /// Example:
  /// { "name": "Nama wajib diisi" }
  final Map<String, String?> errors;

  /// ⏳ Status loading saat submit
  final bool isLoading;

  /// 💬 Pesan global (success / error)
  final String? message;

  // ===========================================================================
  // CONSTRUCTOR
  // ===========================================================================

  const BaseFormState({
    this.fields = const {},
    this.errors = const {},
    this.isLoading = false,
    this.message,
  });

  // ===========================================================================
  // COPY WITH
  // ===========================================================================
  //
  // Digunakan untuk update state tanpa mengubah instance lama (immutable)
  //

  BaseFormState copyWith({
    Map<String, dynamic>? fields,
    Map<String, String?>? errors,
    bool? isLoading,
    String? message,
  }) {
    return BaseFormState(
      fields: fields ?? this.fields,
      errors: errors ?? this.errors,
      isLoading: isLoading ?? this.isLoading,

      // ⚠️ NOTE:
      // message sengaja tidak pakai `?? this.message`
      // agar bisa di-reset ke null jika diperlukan
      message: message,
    );
  }
}
