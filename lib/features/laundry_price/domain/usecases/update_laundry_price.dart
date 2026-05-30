import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/params/save_laundry_price_params.dart';

class UpdateLaundryPrice {
  final LaundryPriceRepository _repository;
  final SessionService _session;

  UpdateLaundryPrice({
    required LaundryPriceRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, void>> call(SaveLaundryPriceParams params) async {
    try {
      final companyId = _session.companyId;

      final price = LaundryPriceEntity(
        id: params.id!,
        laundryItemId: params.laundryItemId,
        speedType: params.speedType,
        serviceType: params.serviceType,
        price: params.price,
      );

      return await _repository.update(companyId: companyId, price: price);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
