import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';

class UpdateLaundryItem {
  final LaundryItemRepository _repository;
  final SessionService _session;

  UpdateLaundryItem({
    required LaundryItemRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, void>> call(UpdateLaundryItemParams params) async {
    try {
      final companyId = _session.companyId;

      final item = LaundryItemEntity(
        id: params.id,
        name: params.name,
        category: params.category,
      );

      return await _repository.update(companyId: companyId, item: item);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
