import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_stream_state.freezed.dart';

@freezed
class BaseStreamState<T> with _$BaseStreamState<T> {
  const factory BaseStreamState.loading() = _Loading;
  const factory BaseStreamState.loaded(List<T> data) = _Loaded;
  const factory BaseStreamState.empty() = _Empty;
  const factory BaseStreamState.error(String message) = _Error;
}
