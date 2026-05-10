// features/laundry_price/domain/repositories/laundry_price_repository.dart

import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';

abstract class LaundryPriceRepository {
  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  Stream<Either<Failure, List<LaundryPriceEntity>>> streamByLaundryItemId({
    required String companyId,
    required String itemId,
  });

  /// =========================
  /// GET BY ID
  /// =========================

  Future<Either<Failure, LaundryPriceEntity?>> getById({
    required String companyId,
    required String id,
  });

  /// =========================
  /// CREATE
  /// =========================
  Future<Either<Failure, void>> create({
    required String companyId,
    required LaundryPriceEntity price,
  });

  /// =========================
  /// UPDATE
  /// =========================
  Future<Either<Failure, void>> update({
    required String companyId,
    required LaundryPriceEntity price,
  });

  Future<Either<Failure, void>> deleteById({
    required String companyId,
    required String id,
  });

  Future<Either<Failure, void>> deleteByItemId({
    required String companyId,
    required String itemId,
  });
}
