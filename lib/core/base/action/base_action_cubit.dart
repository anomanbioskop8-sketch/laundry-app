import 'package:app_laundry/core/base/action/base_action_state.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseActionCubit<T> extends Cubit<BaseActionState<T>> {
  BaseActionCubit() : super(const BaseActionState.initial());

  Future<void> execute({
    required Future<Either<Failure, T>> Function() call,

    String? successMessage,

    Future<void> Function(T data)? onSuccess,
  }) async {
    emit(const BaseActionState.loading());

    try {
      final result = await call();

      await result.fold(
        // =========================
        // ERROR
        // =========================
        (failure) async {
          emit(BaseActionState.error(message: failure.message));
        },

        // =========================
        // SUCCESS
        // =========================
        (data) async {
          /// 🔥 callback success
          if (onSuccess != null) {
            await onSuccess(data);
          }

          emit(BaseActionState.success(data: data, message: successMessage));
        },
      );
    } catch (e) {
      emit(BaseActionState.error(message: e.toString()));
    }
  }

  // =========================
  // RESET
  // =========================

  void reset() {
    emit(const BaseActionState.initial());
  }
}
