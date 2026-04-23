// =============================================================================
// File        : base_cubit.dart
// Path        : core/base/cubit/base_cubit.dart
// Layer       : Presentation (State Management - Base)
// -----------------------------------------------------------------------------
// BaseCubit<T>
//
// Responsibility:
// - Menangani stream data (real-time / async data).
// - Mengelola state generik:
//   - Loading
//   - Success
//   - Empty
//   - Error
//
// - Menghindari boilerplate pada setiap Cubit.
//
// Usage:
// - Digunakan oleh fitur (CustomerCubit, OrderCubit, dll).
// - Cocok untuk stream dari Firestore / API.
//
// Flow:
// 1. Emit loading
// 2. Subscribe ke stream
// 3. Handle data / error
// 4. Emit state sesuai kondisi
//
// Notes:
// - Subscription dikelola otomatis (cancel saat re-listen & dispose).
// - Support intercept (onData) untuk custom behavior.
// =============================================================================

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_laundry/core/base/cubit/base_state.dart';

abstract class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit() : super(BaseInitial());

  // ===========================================================================
  // STREAM SUBSCRIPTION
  // ===========================================================================
  //
  // Menyimpan subscription aktif untuk:
  // - Mencegah multiple listener
  // - Cleanup saat cubit dispose
  //

  StreamSubscription<T>? _subscription;

  // ===========================================================================
  // EXECUTE STREAM
  // ===========================================================================
  //
  // Parameter:
  // - stream   → sumber data stream
  // - isList   → apakah data berbentuk List (untuk handle empty)
  // - onData   → optional intercept untuk custom logic
  //
  // Notes:
  // - Jika onData disediakan → developer handle sendiri state
  // - Jika tidak → pakai default behavior
  //

  void executeStream({
    required Stream<T> Function() stream,
    bool isList = false,
    void Function(T data)? onData,
  }) {
    // =========================
    // LOADING STATE
    // =========================
    emit(BaseLoading());

    // =========================
    // CANCEL PREVIOUS STREAM
    // =========================
    _subscription?.cancel();

    try {
      _subscription = stream().listen(
        (data) {
          // =========================
          // INTERCEPT (CUSTOM HANDLER)
          // =========================
          if (onData != null) {
            onData(data);
            return;
          }

          // =========================
          // DEFAULT BEHAVIOR
          // =========================
          if (isList && data is List && data.isEmpty) {
            emit(BaseEmpty());
          } else {
            emit(BaseSuccess(data));
          }
        },

        // =========================
        // ERROR HANDLING
        // =========================
        onError: (error, stackTrace) {
          emit(BaseError(error.toString()));
        },
      );
    } catch (e) {
      // =========================
      // STREAM INIT ERROR
      // =========================
      emit(BaseError(e.toString()));
    }
  }

  // ===========================================================================
  // DISPOSE
  // ===========================================================================
  //
  // Cleanup subscription untuk mencegah memory leak
  //

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
