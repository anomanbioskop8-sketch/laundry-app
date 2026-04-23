// =============================================================================
// File        : base_action_cubit.dart
// Path        : core/base/action/base_action_cubit.dart
// Layer       : Presentation (State Management - Base)
// -----------------------------------------------------------------------------
// BaseActionCubit
//
// Responsibility:
// - Menangani proses action (create, update, delete, dll).
// - Mengelola state: loading, success, error.
// - Mengintegrasikan UI feedback global:
//   - Loading Overlay
//   - Snackbar (success / error)
//
// Usage:
// - Digunakan oleh ActionCubit (misalnya CustomerActionCubit).
// - Mengurangi boilerplate pada setiap action.
//
// Flow:
// 1. Emit loading (optional)
// 2. Jalankan use case
// 3. Handle result (success / failure)
// 4. Tampilkan UI feedback (optional)
// =============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';

import 'base_action_state.dart';

abstract class BaseActionCubit extends Cubit<BaseActionState> {
  BaseActionCubit() : super(ActionInitial());

  // ===========================================================================
  // EXECUTE ACTION
  // ===========================================================================
  //
  // Digunakan untuk semua operasi:
  // - Create
  // - Update
  // - Delete
  //
  // Parameter:
  // - call           → fungsi use case
  // - successMessage → pesan saat berhasil
  // - showLoading    → tampilkan loading overlay
  // - showSnackbar   → tampilkan snackbar
  //

  Future<void> execute({
    required Future<Either<Failure, void>> Function() call,
    String successMessage = 'Berhasil',
    bool showLoading = true,
    bool showSnackbar = true,
  }) async {
    try {
      // =========================
      // LOADING START
      // =========================
      if (showLoading) {
        emit(ActionLoading());
        AppUIService.showLoading();
      }

      // =========================
      // EXECUTE USECASE
      // =========================
      final result = await call();

      // =========================
      // HANDLE RESULT
      // =========================
      result.fold(
        (failure) => _handleError(failure, showSnackbar),
        (_) => _handleSuccess(successMessage, showSnackbar),
      );
    } catch (e) {
      // =========================
      // UNEXPECTED ERROR
      // =========================
      emit(ActionError(e.toString()));

      if (showSnackbar) {
        AppUIService.error(e.toString());
      }
    } finally {
      // =========================
      // LOADING END (ALWAYS)
      // =========================
      if (showLoading) {
        AppUIService.hideLoading();
      }
    }
  }

  // ===========================================================================
  // HANDLER: SUCCESS
  // ===========================================================================

  void _handleSuccess(String message, bool showSnackbar) {
    emit(ActionSuccess(message));

    if (showSnackbar) {
      AppUIService.success(message);
    }
  }

  // ===========================================================================
  // HANDLER: ERROR
  // ===========================================================================

  void _handleError(Failure failure, bool showSnackbar) {
    emit(ActionError(failure.message));

    if (showSnackbar) {
      AppUIService.error(failure.message);
    }
  }

  // ===========================================================================
  // RESET STATE
  // ===========================================================================
  //
  // Digunakan untuk:
  // - Reset UI state setelah action selesai
  // - Menghindari state tertinggal (misalnya error lama)
  //

  void reset() {
    emit(ActionInitial());
    AppUIService.hideLoading();
  }
}
