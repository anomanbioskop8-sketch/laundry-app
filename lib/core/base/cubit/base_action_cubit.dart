import 'package:app_laundry/core/base/cubit/base_action_state.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseActionCubit<T> extends Cubit<BaseActionState<T>> {
  BaseActionCubit() : super(const BaseActionState.initial());

  Future<void> execute({
    required Future<Either<Failure, T>> Function() call,
    String? successMessage,
  }) async {
    emit(const BaseActionState.loading());

    try {
      final result = await call();

      result.fold(
        (failure) {
          emit(BaseActionState.error(message: failure.message));
        },
        (data) {
          emit(BaseActionState.success(data: data, message: successMessage));
        },
      );
    } catch (e) {
      emit(BaseActionState.error(message: e.toString()));
    }
  }

  void reset() {
    emit(const BaseActionState.initial());
  }
}
