// =============================================================================
// File        : base_builder.dart
// Path        : core/base/widgets/base_builder.dart
// Layer       : Presentation (UI - Helper Widget)
// -----------------------------------------------------------------------------
// BaseBuilder<T>
//
// Responsibility:
// - Widget helper untuk menangani rendering UI berdasarkan BaseState<T>.
// - Mengurangi boilerplate pada BlocBuilder / StreamBuilder.
//
// Supported State:
// - BaseLoading  → tampilkan loading widget
// - BaseError    → tampilkan error widget / message
// - BaseEmpty    → tampilkan empty state
// - BaseSuccess  → render data via onSuccess
//
// Usage:
// BaseBuilder(
//   state: state,
//   onSuccess: (data) => ListView(...),
// )
//
// Notes:
// - onSuccess wajib diisi.
// - loading / error / empty bersifat optional (punya default).
// - Tidak bergantung ke Cubit → pure UI layer.
// =============================================================================

import 'package:app_laundry/core/base/cubit/base_state.dart';
import 'package:flutter/material.dart';

class BaseBuilder<T> extends StatelessWidget {
  /// 🔄 State dari Cubit/BLoC
  final BaseState<T> state;

  /// ✅ Builder utama saat data berhasil
  final Widget Function(T data) onSuccess;

  /// ⏳ Custom loading widget (optional)
  final Widget? loading;

  /// ❌ Custom error builder (optional)
  final Widget Function(String message)? onError;

  /// 📭 Custom empty widget (optional)
  final Widget? empty;

  const BaseBuilder({
    super.key,
    required this.state,
    required this.onSuccess,
    this.loading,
    this.onError,
    this.empty,
  });

  @override
  Widget build(BuildContext context) {
    // ===========================================================
    // LOADING STATE
    // ===========================================================
    if (state is BaseLoading<T>) {
      return loading ?? const Center(child: CircularProgressIndicator());
    }

    // ===========================================================
    // ERROR STATE
    // ===========================================================
    if (state is BaseError<T>) {
      final message = (state as BaseError<T>).message;

      return onError?.call(message) ?? Center(child: Text(message));
    }

    // ===========================================================
    // EMPTY STATE
    // ===========================================================
    if (state is BaseEmpty<T>) {
      return empty ?? const Center(child: Text('Data kosong'));
    }

    // ===========================================================
    // SUCCESS STATE
    // ===========================================================
    if (state is BaseSuccess<T>) {
      final data = (state as BaseSuccess<T>).data;
      return onSuccess(data);
    }

    // ===========================================================
    // INITIAL / FALLBACK
    // ===========================================================
    return const SizedBox.shrink();
  }
}
