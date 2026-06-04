// =============================================================================
// File : get_customers_by_ids.dart
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';

class GetCustomersByIds {
  final CustomerRepository _repository;
  final SessionService _session;

  GetCustomersByIds({
    required CustomerRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, List<CustomerEntity>>> call(List<String> ids) async {
    try {
      return _repository.getByIds(companyId: _session.companyId, ids: ids);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
