import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/delete_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/save_customer.dart';

class CustomerActionCubit extends BaseActionCubit<void> {
  final SaveCustomer save;
  final DeleteCustomer delete;

  CustomerActionCubit({required this.save, required this.delete});

  Future<void> submit(SaveCustomerParams params) async {
    await execute(
      call: () => save(params),
      successMessage: 'Customer berhasil disimpan',
    );
  }

  Future<void> deleteCustomer(DeleteCustomerParams params) {
    return execute(
      call: () => delete(params),
      successMessage: 'Customer berhasil dihapus',
    );
  }
}
