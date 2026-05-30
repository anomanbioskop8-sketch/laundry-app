import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/params/create_laundry_item_params.dart';
import 'package:uuid/uuid.dart';

class CreateLaundryItem {
  final LaundryItemRepository _repository;
  final SessionService _session;

  const CreateLaundryItem({
    required LaundryItemRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, LaundryItemEntity>> call(
    CreateLaundryItemParams params,
  ) async {
    try {
      final companyId = _session.companyId;

      final id = const Uuid().v4();

      final item = LaundryItemEntity(
        id: id,
        name: params.name,
        category: params.category,
      );

      return _repository.create(companyId: companyId, item: item);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
