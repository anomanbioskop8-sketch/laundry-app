import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/customer_params.dart';

class DeleteCustomer {
  final CustomerRepository repository;
  final SessionService session;

  DeleteCustomer({required this.repository, required this.session});

  Future<Either<Failure, void>> call(DeleteCustomerParams params) async {
    try {
      final companyId = session.companyId;

      /// 🔐 (optional) permission check
      // if (session.role != UserRole.owner) {
      //   return Left(PermissionFailure('Tidak punya akses'));
      // }

      return repository.deleteCustomer(
        companyId: companyId,
        customerId: params.id,
      );
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    }
  }
}
