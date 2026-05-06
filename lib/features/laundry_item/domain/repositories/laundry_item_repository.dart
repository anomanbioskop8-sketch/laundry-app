import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';

abstract class LaundryItemRepository {
  /// =========================
  /// CREATE
  /// =========================
  Future<Either<Failure, void>> createLaundryItem({
    required String companyId,
    required LaundryItemEntity item,
  });

  /// =========================
  /// GET SINGLE
  /// =========================
  Future<Either<Failure, LaundryItemEntity?>> getLaundryItemById({
    required String companyId,
    required String itemId,
  });

  /// =========================
  /// STREAM ALL (REALTIME)
  /// =========================
  Stream<Either<Failure, List<LaundryItemEntity>>> streamLaundryItems(
    String companyId,
  );

  /// =========================
  /// UPDATE
  /// =========================
  Future<Either<Failure, void>> updateLaundryItem({
    required String companyId,
    required LaundryItemEntity item,
  });

  /// =========================
  /// DELETE
  /// =========================
  Future<Either<Failure, void>> deleteLaundryItem({
    required String companyId,
    required String itemId,
  });
}
