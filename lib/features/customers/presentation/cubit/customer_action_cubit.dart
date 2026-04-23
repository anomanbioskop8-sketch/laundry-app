import 'package:app_laundry/core/base/action/base_action_cubit.dart';
import 'package:app_laundry/core/services/app_ui_service.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/usecases/create_customer_usecase.dart';
import 'package:app_laundry/features/customers/domain/usecases/delete_customer_usecase.dart';
import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';
import 'package:app_laundry/features/customers/domain/usecases/update_customer_usecase.dart';

class CustomerActionCubit extends BaseActionCubit {
  final CreateCustomerUseCase createUseCase;
  final UpdateCustomerUseCase updateUseCase;
  final DeleteCustomerUseCase deleteUseCase;

  CustomerActionCubit(
    this.createUseCase,
    this.updateUseCase,
    this.deleteUseCase,
  );

  Future<void> create(CustomerEntity customer) async {
    await execute(
      call: () => createUseCase(CreateCustomerParams(customer)),
      successMessage: 'Customer berhasil dibuat',
    );
  }

  Future<void> update(CustomerEntity customer) async {
    await execute(
      call: () => updateUseCase(UpdateCustomerParams(customer)),
      successMessage: 'Customer berhasil diupdate',
    );
  }

  Future<void> delete(String id) async {
    final confirm = await AppUIService.confirm(
      title: 'Hapus Customer',
      message: 'Yakin ingin menghapus customer ini?',
      type: DialogType.delete,
    );

    if (!confirm) return;

    await execute(
      call: () => deleteUseCase(DeleteCustomerParams(id)),
      successMessage: 'Customer berhasil dihapus',
    );
  }
}
