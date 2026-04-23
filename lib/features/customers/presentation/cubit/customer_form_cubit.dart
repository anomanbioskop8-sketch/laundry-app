import 'package:app_laundry/core/base/form/base_form_cubit.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/usecases/create_customer_usecase.dart';
import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';

class CustomerFormCubit extends BaseFormCubit<void> {
  final CreateCustomerUseCase createUseCase;

  CustomerFormCubit(this.createUseCase);

  @override
  String? validateField(String key, value) {
    switch (key) {
      case 'name':
        if (value == null || value.isEmpty) return 'Nama wajib diisi';
        break;

      case 'phone':
        if (value == null || value.isEmpty) return 'No HP wajib diisi';
        break;
    }
    return null;
  }

  @override
  Future<Either<Failure, void>> onSubmit(data) {
    final entity = CustomerEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: data['name'],
      phone: data['phone'],
      address: data['address'] ?? '',
      companyId: data['companyId'],
    );

    CreateCustomerParams params = CreateCustomerParams(entity);

    return createUseCase(params);
  }
}
