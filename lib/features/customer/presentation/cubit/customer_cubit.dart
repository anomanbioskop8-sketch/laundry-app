import 'dart:async';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/create_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/delete_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/stream_customers.dart';
import 'package:app_laundry/features/customer/domain/usecase/update_customer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final StreamCustomers streamCustomers;
  final CreateCustomer createCustomer;
  final UpdateCustomer updateCustomer;
  final DeleteCustomer deleteCustomer;

  StreamSubscription? _subscription;

  CustomerCubit(
    this.streamCustomers,
    this.createCustomer,
    this.updateCustomer,
    this.deleteCustomer,
  ) : super(const CustomerState.initial());

  /// =========================
  /// START LISTEN REALTIME
  /// =========================
  void listenCustomers() {
    emit(const CustomerState.loading());

    _subscription?.cancel();

    _subscription = streamCustomers().listen((result) {
      result.fold((failure) => emit(CustomerState.error(failure.message)), (
        customers,
      ) {
        if (customers.isEmpty) {
          emit(const CustomerState.empty());
        } else {
          emit(CustomerState.loaded(customers));
        }
      });
    });
  }

  /// =========================
  /// CREATE
  /// =========================
  Future<void> create(CreateCustomerParams params) async {
    final result = await createCustomer(params);

    result.fold(
      (failure) => emit(CustomerState.error(failure.message)),
      (_) {},
    );
  }

  /// =========================
  /// UPDATE
  /// =========================
  Future<void> update(CustomerEntity customer) async {
    final result = await updateCustomer(customer);

    result.fold(
      (failure) => emit(CustomerState.error(failure.message)),
      (_) {},
    );
  }

  /// =========================
  /// DELETE
  /// =========================
  Future<void> delete(DeleteCustomerParams params) async {
    final result = await deleteCustomer(params);

    result.fold(
      (failure) => emit(CustomerState.error(failure.message)),
      (_) {},
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
