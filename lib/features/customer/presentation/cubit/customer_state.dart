import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/customer_entity.dart';

part 'customer_state.freezed.dart';

@freezed
class CustomerState with _$CustomerState {
  const factory CustomerState.initial() = _Initial;

  const factory CustomerState.loading() = _Loading;

  const factory CustomerState.loaded(List<CustomerEntity> customers) = _Loaded;

  const factory CustomerState.empty() = _Empty;

  const factory CustomerState.error(String message) = _Error;
}
