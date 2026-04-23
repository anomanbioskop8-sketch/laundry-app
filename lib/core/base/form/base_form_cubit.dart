// =============================================================================
// File        : base_form_cubit.dart
// Path        : core/base/form/base_form_cubit.dart
// Layer       : Presentation (State Management - Form)
// -----------------------------------------------------------------------------
// BaseFormCubit<T>
//
// Responsibility:
// - Mengelola state form (fields, validation, submit).
// - Menyediakan API generic untuk semua form di aplikasi.
// - Menghandle loading + snackbar via AppUIService.
//
// Features:
// - Dynamic form field (Map-based)
// - Field validation per key
// - Full form validation
// - Submit handler (integrasi usecase / repository)
// - Global loading + snackbar
//
// Flow:
// 1. setField() → update value + validate per field
// 2. validate() → validate seluruh field
// 3. submit() →
//    - validate form
//    - show loading
//    - call onSubmit()
//    - handle success / error
//
// Notes:
// - validateField() wajib di-override di child.
// - onSubmit() berisi call ke UseCase.
// - Gunakan key yang konsisten (name, phone, dll).
// =============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';

import 'base_form_state.dart';

abstract class BaseFormCubit<T> extends Cubit<BaseFormState> {
  BaseFormCubit() : super(const BaseFormState());

  // ===========================================================================
  // FIELD MANAGEMENT
  // ===========================================================================
  //
  // Mengupdate nilai field + validasi langsung
  //

  void setField(String key, dynamic value) {
    final newFields = Map<String, dynamic>.from(state.fields);
    final newErrors = Map<String, String?>.from(state.errors);

    // update value
    newFields[key] = value;

    // validate field
    newErrors[key] = validateField(key, value);

    emit(state.copyWith(fields: newFields, errors: newErrors));
  }

  // ===========================================================================
  // FORM VALIDATION
  // ===========================================================================
  //
  // Validasi semua field sekaligus
  //

  bool validate() {
    final newErrors = <String, String?>{};

    state.fields.forEach((key, value) {
      newErrors[key] = validateField(key, value);
    });

    emit(state.copyWith(errors: newErrors));

    // return true jika semua valid
    return !newErrors.values.any((e) => e != null);
  }

  // ===========================================================================
  // SUBMIT HANDLER
  // ===========================================================================
  //
  // Flow:
  // - validate form
  // - show loading
  // - call usecase (onSubmit)
  // - handle result (success / error)
  //

  Future<void> submit({
    String successMessage = 'Berhasil',
    bool showLoading = true,
    bool showSnackbar = true,
  }) async {
    // validate dulu
    if (!validate()) return;

    emit(state.copyWith(isLoading: true));

    if (showLoading) {
      AppUIService.showLoading();
    }

    final result = await onSubmit(state.fields);

    if (showLoading) {
      AppUIService.hideLoading();
    }

    result.fold(
      // =========================
      // ERROR
      // =========================
      (failure) {
        emit(state.copyWith(isLoading: false, message: failure.message));

        if (showSnackbar) {
          AppUIService.error(failure.message);
        }
      },

      // =========================
      // SUCCESS
      // =========================
      (_) {
        emit(state.copyWith(isLoading: false, message: successMessage));

        if (showSnackbar) {
          AppUIService.success(successMessage);
        }
      },
    );
  }

  // ===========================================================================
  // ABSTRACT METHODS (WAJIB DI-OVERRIDE)
  // ===========================================================================

  /// 🔍 Validasi per field
  ///
  /// Example:
  /// if (key == 'name' && value.isEmpty) return 'Nama wajib diisi';
  String? validateField(String key, dynamic value);

  /// 🚀 Submit handler (call UseCase)
  ///
  /// Example:
  /// return createCustomerUseCase(CustomerParams(...));
  Future<Either<Failure, T>> onSubmit(Map<String, dynamic> data);
}
