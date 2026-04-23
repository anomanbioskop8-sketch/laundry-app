import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/usecases/create_customer_usecase.dart';
import '../../domain/usecases/update_customer_usecase.dart';
import '../../domain/usecases/delete_customer_usecase.dart';
import '../../domain/usecases/stream_customers_usecase.dart';
import '../../domain/usecases/params/customer_params.dart';

import 'customer_state.dart';

class CustomerCubit extends Cubit<CustomerState> {
  final StreamCustomersUseCase streamUseCase;
  final CreateCustomerUseCase createUseCase;
  final UpdateCustomerUseCase updateUseCase;
  final DeleteCustomerUseCase deleteUseCase;

  StreamSubscription? _subscription;

  CustomerCubit(
    this.streamUseCase,
    this.createUseCase,
    this.updateUseCase,
    this.deleteUseCase,
  ) : super(CustomerInitial());

  /// ===============================
  /// 🔥 LISTEN REALTIME
  /// ===============================
  void listen(String companyId) {
    emit(CustomerLoading());

    _subscription?.cancel();

    _subscription = streamUseCase(StreamCustomerParams(companyId)).listen(
      (data) {
        if (data.isEmpty) {
          emit(CustomerEmpty());
        } else {
          emit(CustomerLoaded(data));
        }
      },
      onError: (error) {
        emit(CustomerError(error.toString()));
      },
    );
  }

  /// ===============================
  /// ➕ CREATE
  /// ===============================
  Future<void> create(CustomerEntity customer) async {
    final result = await createUseCase(CreateCustomerParams(customer));

    result.fold((f) => emit(CustomerError(f.message)), (_) {});
  }

  /// ===============================
  /// ✏️ UPDATE
  /// ===============================
  Future<void> update(CustomerEntity customer) async {
    final result = await updateUseCase(UpdateCustomerParams(customer));

    result.fold((f) => emit(CustomerError(f.message)), (_) {});
  }

  /// ===============================
  /// ❌ DELETE
  /// ===============================
  Future<void> delete(String id) async {
    final result = await deleteUseCase(DeleteCustomerParams(id));

    result.fold((f) => emit(CustomerError(f.message)), (_) {});
  }

  /// ===============================
  /// 🧹 CLEANUP
  /// ===============================
  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
