import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/features/customer/domain/usecase/create_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/delete_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/update_customer.dart';
import 'package:flutter/material.dart';

class CustomerActionCubit extends BaseActionCubit<void> {
  final CreateCustomer create;
  final UpdateCustomer update;
  final DeleteCustomer delete;

  CustomerActionCubit(this.create, this.update, this.delete);

  Future<void> createCustomer(CreateCustomerParams params) {
    debugPrint('Action Cubit Success: ');
    return execute(call: () => create(params));
  }

  Future<void> deleteCustomer(DeleteCustomerParams params) {
    debugPrint('Action Cubit Success: ');
    return execute(call: () => delete(params));
  }
}
