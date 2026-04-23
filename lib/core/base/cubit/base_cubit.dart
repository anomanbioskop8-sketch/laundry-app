import 'package:app_laundry/core/base/cubit/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<T> extends Cubit<BaseState<T>> {
  BaseCubit() : super(BaseInitial());

  void executeStream({
    required Stream<T> Function() stream,
    bool isList = false,
  }) {
    emit(BaseLoading());

    stream().listen((data) {
      if (isList && (data as List).isEmpty) {
        emit(BaseEmpty());
      } else {
        emit(BaseSuccess(data));
      }
    }, onError: (e) => emit(BaseError(e.toString())));
  }
}
