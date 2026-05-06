import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';

class DeleteLaundryItem {
  final LaundryItemRepository repository;
  final SessionService session;

  DeleteLaundryItem({required this.repository, required this.session});

  Future<Either<Failure, void>> call(DeleteLaundryItemParams params) async {
    try {
      final companyId = session.companyId;

      /// 🔐 (optional) permission check
      // if (session.role != UserRole.owner) {
      //   return Left(PermissionFailure('Tidak punya akses'));
      // }

      return repository.deleteLaundryItem(
        companyId: companyId,
        itemId: params.id,
      );
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    }
  }
}
