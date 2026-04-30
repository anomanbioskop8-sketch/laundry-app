import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/save_customer.dart';

class CustomerFormCubit extends BaseActionCubit<void> {
  final SaveCustomer saveCustomer;

  CustomerFormCubit(this.saveCustomer);

  Future<void> submit(SaveCustomerParams params) async {
    await execute(
      call: () => saveCustomer(params),
      successMessage: 'Customer berhasil disimpan',
    );
  }
}
