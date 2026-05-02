import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';
import 'package:uuid/uuid.dart';

class CreateCustomer {
  final CustomerRepository repository;
  final SessionService session;

  CreateCustomer({required this.repository, required this.session});

  Future<Either<Failure, void>> call(CreateCustomerParams params) async {
    try {
      final companyId = session.companyId;

      final id = const Uuid().v4();

      final customer = CustomerEntity(
        id: id,
        name: params.name,
        phone: params.phone,
      );

      return await repository.createCustomer(
        companyId: companyId,
        customer: customer,
      );
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    }
  }
}
