import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';

abstract class LaundryItemRepository {
  /// =========================
  /// STREAM ALL
  /// =========================

  Stream<Either<Failure, List<LaundryItemEntity>>> streamAll(String companyId);

  /// =========================
  /// GET BY ID
  /// =========================

  Future<Either<Failure, LaundryItemEntity?>> getById({
    required String companyId,
    required String id,
  });

  /// =========================
  /// CREATE
  /// =========================

  Future<Either<Failure, LaundryItemEntity>> create({
    required String companyId,
    required LaundryItemEntity item,
  });

  /// =========================
  /// UPDATE
  /// =========================

  Future<Either<Failure, void>> update({
    required String companyId,
    required LaundryItemEntity item,
  });

  /// =========================
  /// DELETE
  /// =========================

  Future<Either<Failure, void>> deleteById({
    required String companyId,
    required String id,
  });
}
