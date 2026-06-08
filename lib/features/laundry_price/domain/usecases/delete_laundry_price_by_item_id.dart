import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';

class DeleteLaundryPriceByItemId {
  final LaundryPriceRepository _repository;
  final SessionService _session;

  const DeleteLaundryPriceByItemId({
    required LaundryPriceRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, void>> call(String itemId) async {
    try {
      final companyId = _session.companyId;

      /// 🔐 (optional) permission check
      // if (session.role != UserRole.owner) {
      //   return Left(PermissionFailure('Tidak punya akses'));
      // }

      return _repository.deleteByItemId(companyId: companyId, itemId: itemId);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
