import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../features/auth/domain/entities/user_entity.dart';
part 'session_state.freezed.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.initial() = _Initial;

  const factory SessionState.active({
    required UserEntity user,
    required String userId,
    required String role,
    required String companyId,
  }) = _Active;

  const factory SessionState.inactive() = _Inactive;
}
