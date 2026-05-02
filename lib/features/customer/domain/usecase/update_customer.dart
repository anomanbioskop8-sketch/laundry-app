import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';

class UpdateCustomer {
  final CustomerRepository repository;
  final SessionService session;

  UpdateCustomer({required this.repository, required this.session});

  Future<Either<Failure, void>> call(UpdateCustomerParams params) async {
    try {
      final companyId = session.companyId;

      final customer = CustomerEntity(
        id: params.id,
        name: params.name,
        phone: params.phone,
      );

      return await repository.updateCustomer(
        companyId: companyId,
        customer: customer,
      );
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    }
  }
}
