import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/repositories/laundry_item_repository.dart';

class StreamLaundryItems {
  final LaundryItemRepository repository;
  final SessionService session;

  StreamLaundryItems({required this.repository, required this.session});

  Stream<Either<Failure, List<LaundryItemEntity>>> call() {
    try {
      final companyId = session.companyId;

      return repository.streamLaundryItems(companyId);
    } on UnauthorizedException catch (e) {
      return Stream.value(Left(UnauthorizedFailure(e.message)));
    }
  }
}
