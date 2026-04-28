import 'dart:async';

import 'package:app_laundry/core/base/cubit/base_stream_state.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseStreamCubit<T> extends Cubit<BaseStreamState<T>> {
  StreamSubscription<Either<Failure, List<T>>>? _subscription;

  BaseStreamCubit() : super(const BaseStreamState.loading());

  /// =========================
  /// LISTEN STREAM
  /// =========================
  void listen(Stream<Either<Failure, List<T>>> Function() stream) {
    emit(const BaseStreamState.loading());

    _subscription?.cancel();

    _subscription = stream().listen(
      (result) {
        result.fold(
          (failure) {
            emit(BaseStreamState.error(failure.message));
          },
          (data) {
            if (data.isEmpty) {
              emit(const BaseStreamState.empty());
            } else {
              emit(BaseStreamState.loaded(data));
            }
          },
        );
      },
      onError: (e) {
        emit(BaseStreamState.error(e.toString()));
      },
    );
  }

  /// =========================
  /// CANCEL MANUAL (OPTIONAL)
  /// =========================
  void cancel() {
    _subscription?.cancel();
    _subscription = null;
  }

  @override
  Future<void> close() {
    cancel();
    return super.close();
  }
}
