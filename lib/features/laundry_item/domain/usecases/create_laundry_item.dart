import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';
import 'package:uuid/uuid.dart';

class CreateLaundryItem {
  final LaundryItemRepository repository;
  final SessionService session;

  CreateLaundryItem({required this.repository, required this.session});

  Future<Either<Failure, void>> call(CreateLaundryItemParams params) async {
    try {
      final companyId = session.companyId;

      final id = const Uuid().v4();

      final item = LaundryItemEntity(
        id: id,
        name: params.name,
        category: params.category,
      );

      return await repository.createLaundryItem(
        companyId: companyId,
        item: item,
      );
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    }
  }
}
