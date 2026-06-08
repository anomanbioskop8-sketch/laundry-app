import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_action_state.freezed.dart';

@freezed
class BaseActionState<T> with _$BaseActionState<T> {
  /// idle
  const factory BaseActionState.initial() = _Initial<T>;

  /// loading
  const factory BaseActionState.loading() = _Loading<T>;

  /// success (optional data)
  const factory BaseActionState.success({required T data, String? message}) =
      _Success<T>;

  /// error
  const factory BaseActionState.error({required String message, String? code}) =
      _Error<T>;
}
