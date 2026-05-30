import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';

class StreamLaundryPricesByServiceAndSpeed {
  final LaundryPriceRepository _repository;
  final SessionService _session;

  StreamLaundryPricesByServiceAndSpeed({
    required LaundryPriceRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Stream<Either<Failure, List<LaundryPriceEntity>>> call({
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
  }) {
    try {
      final companyId = _session.companyId;

      return _repository.streamByServiceAndSpeed(
        companyId: companyId,
        serviceType: serviceType,
        speedType: speedType,
      );
    } on UnauthorizedException catch (e) {
      return Stream.value(Left(e.failure));
    }
  }
}
