import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';

class DeleteLaundryItem {
  final LaundryItemRepository _repository;
  final SessionService _session;

  DeleteLaundryItem({
    required LaundryItemRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, void>> call(String id) async {
    try {
      final companyId = _session.companyId;

      /// 🔐 (optional) permission check
      // if (session.role != UserRole.owner) {
      //   return Left(PermissionFailure('Tidak punya akses'));
      // }

      return _repository.deleteById(companyId: companyId, id: id);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
