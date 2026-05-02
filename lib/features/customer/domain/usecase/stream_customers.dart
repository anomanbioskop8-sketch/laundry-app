import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';

class StreamCustomers {
  final CustomerRepository repository;
  final SessionService session;

  StreamCustomers({required this.repository, required this.session});

  Stream<Either<Failure, List<CustomerEntity>>> call() {
    try {
      final companyId = session.companyId;

      return repository.streamCustomers(companyId);
    } on UnauthorizedException catch (e) {
      return Stream.value(Left(UnauthorizedFailure(e.message)));
    }
  }
}
