import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_state.freezed.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;

  const factory SessionState.loading() = _Loading;

  const factory SessionState.active(UserEntity user) = _Active;

  const factory SessionState.inactive() = _Inactive;
}
