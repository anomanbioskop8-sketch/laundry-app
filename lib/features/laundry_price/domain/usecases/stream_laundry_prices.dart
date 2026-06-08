import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';

class StreamLaundryPrices {
  final LaundryPriceRepository _repository;
  final SessionService _session;

  StreamLaundryPrices({
    required LaundryPriceRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Stream<Either<Failure, List<LaundryPriceEntity>>> call(String laundryItemId) {
    try {
      final companyId = _session.companyId;

      return _repository.streamByLaundryItemId(
        companyId: companyId,
        itemId: laundryItemId,
      );
    } on UnauthorizedException catch (e) {
      return Stream.value(Left(e.failure));
    }
  }
}
