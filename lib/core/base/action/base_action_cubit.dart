import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/services/loading_overlay_service.dart';
import 'package:app_laundry/core/services/snackbar_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../error/failure.dart';
import '../../utils/either.dart';
import 'base_action_state.dart';

abstract class BaseActionCubit extends Cubit<BaseActionState> {
  BaseActionCubit() : super(ActionInitial());

  /// ===============================
  /// HANDLE ACTION (void)
  /// ===============================
  Future<void> execute({
    required Future<Either<Failure, void>> Function() call,
    String successMessage = 'Berhasil',
    bool showLoading = true,
    bool showSnackbar = true,
  }) async {
    if (showLoading) {
      emit(ActionLoading());
      AppUIService.showLoading(); // 🔥 GLOBAL LOADING
    }

    final result = await call();

    AppUIService.hideLoading(); // 🔥 ALWAYS HIDE

    result.fold(
      (failure) {
        emit(ActionError(failure.message));

        if (showSnackbar) {
          AppUIService.error(failure.message); // 🔥 ini yang kamu tanya
        }
      },
      (_) {
        emit(ActionSuccess(successMessage));

        if (showSnackbar) {
          AppUIService.success(successMessage);
        }
      },
    );
  }

  /// ===============================
  /// RESET STATE (opsional)
  /// ===============================
  void reset() {
    emit(ActionInitial());
    AppUIService.hideLoading();
  }
}
