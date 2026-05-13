import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';

import 'package:uuid/uuid.dart';

class CreateDefaultLaundryPrices {
  final LaundryPriceRepository _repository;
  final SessionService _session;

  const CreateDefaultLaundryPrices({
    required LaundryPriceRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, void>> call(String laundryItemId) async {
    try {
      final companyId = _session.companyId;

      const uuid = Uuid();

      for (final serviceType in LaundryServiceType.values) {
        for (final speedType in LaundrySpeedType.values) {
          final price = LaundryPriceEntity(
            id: uuid.v4(),
            laundryItemId: laundryItemId,
            speedType: speedType,
            serviceType: serviceType,
            price: 0,
          );

          final result = await _repository.create(
            companyId: companyId,
            price: price,
          );

          if (result.isLeft) {
            return result;
          }
        }
      }

      return const Right(null);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
