// =============================================================================
// File        : get_laundry_price.dart
// Path        : lib/features/laundry_price/domain/usecases/get_laundry_price.dart
// Layer       : Domain (Use Case)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengambil harga laundry berdasarkan kombinasi:
//   companyId, itemId, serviceType, speedType
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/repositories/laundry_price_repository.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/params/get_laundry_price_params.dart';

class GetLaundryPrice {
  final LaundryPriceRepository _repository;
  final SessionService _session;
  GetLaundryPrice({
    required LaundryPriceRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, LaundryPriceEntity?>> call(
    GetLaundryPriceParams params,
  ) async {
    try {
      return _repository.getLaundryPrice(
        companyId: _session.companyId,
        itemId: params.itemId,
        serviceType: params.serviceType,
        speedType: params.speedType,
      );
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
