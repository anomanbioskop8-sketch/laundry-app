// =============================================================================
// File        : setting_cubit.dart
// Path        : lib/features/setting/presentation/cubit/setting_cubit.dart
// Layer       : Presentation
// -----------------------------------------------------------------------------
// Fungsi:
// - Stream realtime setting aplikasi
// - Sinkron dengan company aktif pada session
// =============================================================================

import 'dart:async';

import 'package:app_laundry/core/base/stream/base_stream_cubit.dart';
import 'package:app_laundry/core/base/stream/base_stream_state.dart';

import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

import 'package:app_laundry/features/setting/domain/usecases/stream_setting.dart';

class SettingCubit extends BaseStreamCubit<SettingEntity> {
  // =========================
  // DEPENDENCY
  // =========================

  final StreamSetting _streamSetting;

  SettingCubit({required StreamSetting streamSetting})
    : _streamSetting = streamSetting;

  // =========================
  // STREAM SUBSCRIPTION
  // =========================

  StreamSubscription<Either<dynamic, SettingEntity?>>? _subscription;

  // =========================
  // LOAD
  // =========================

  Future<void> load() async {
    emit(const BaseStreamState.loading());
    await _subscription?.cancel();

    _subscription = _streamSetting().listen((result) {
      result.fold(
        (failure) {
          emit(BaseStreamState.error(failure.message));
        },

        (setting) {
          if (setting == null) {
            emit(const BaseStreamState.empty());

            return;
          }

          emit(BaseStreamState.loaded([setting]));
        },
      );
    });
  }

  // =========================
  // GETTER
  // =========================

  SettingEntity? get setting {
    return state.maybeWhen(
      loaded: (data) {
        if (data.isEmpty) {
          return null;
        }

        return data.first;
      },

      orElse: () => null,
    );
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  Future<void> close() async {
    await _subscription?.cancel();

    return super.close();
  }
}
