import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';

abstract class CustomerState {}

class CustomerInitial extends CustomerState {}

class CustomerLoading extends CustomerState {}

class CustomerLoaded extends CustomerState {
  final List<CustomerEntity> data;

  CustomerLoaded(this.data);
}

class CustomerEmpty extends CustomerState {}

class CustomerError extends CustomerState {
  final String message;

  CustomerError(this.message);
}
