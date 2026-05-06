import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/features/customer/domain/usecase/create_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/update_customer.dart';

class SaveCustomer {
  final CreateCustomer createCustomer;
  final UpdateCustomer updateCustomer;

  SaveCustomer({required this.createCustomer, required this.updateCustomer});

  Future<Either<Failure, void>> call(SaveCustomerParams params) async {
    if (!params.isValid) {
      return Left(AuthFailure('Data tidak valid'));
    }

    /// =========================
    /// UPDATE
    /// =========================
    if (params.isEdit) {
      return updateCustomer(
        UpdateCustomerParams(
          id: params.id!,
          name: params.name,
          phone: params.phone,
          address: params.address,
        ),
      );
    }

    /// =========================
    /// CREATE
    /// =========================
    return createCustomer(
      CreateCustomerParams(
        name: params.name,
        phone: params.phone,
        address: params.address,
      ),
    );
  }
}
