import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/core/constants/customer_strings.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/delete_customer.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/save_laundry_item.dart';

class LaundryItemActionCubit extends BaseActionCubit<void> {
  final SaveLaundryItem save;
  final DeleteLaundryItem delete;

  LaundryItemActionCubit({required this.save, required this.delete});

  Future<void> submit(SaveLaundryItemParams params) async {
    await execute(
      call: () => save(params),
      successMessage: CustomerStrings.saveSuccess,
    );
  }

  Future<void> deleteCustomer(DeleteLaundryItemParams params) {
    return execute(
      call: () => delete(params),
      successMessage: CustomerStrings.deleteSuccess,
    );
  }
}
