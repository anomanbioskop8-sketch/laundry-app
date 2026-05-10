import 'package:app_laundry/core/network/base_crud_remote_datasource.dart';
import 'package:app_laundry/features/laundry_price/data/models/laundry_price_model.dart';

class LaundryPriceRemoteDataSource
    extends BaseCrudRemoteDataSource<LaundryPriceModel> {
  LaundryPriceRemoteDataSource(super.logger, {required super.firestore});

  @override
  String get collection => 'laundry_prices';

  @override
  LaundryPriceModel fromMap(Map<String, dynamic> map, String id) {
    return LaundryPriceModel.fromMap(map, id);
  }

  @override
  Map<String, dynamic> toMap(LaundryPriceModel data) {
    return data.toMap();
  }

  // =========================
  // STREAM BY ITEM ID
  // =========================

  Stream<List<LaundryPriceModel>> streamByLaundryItemId({
    required String companyId,
    required String itemId,
  }) {
    return streamAll(
      companyId,
      queryBuilder: (query) {
        return query.where('laundryItemId', isEqualTo: itemId);
      },
    );
  }

  // =========================
  // GET BY ITEM ID
  // =========================

  Future<List<LaundryPriceModel>> getByLaundryItemId({
    required String companyId,
    required String itemId,
  }) async {
    return safeCall(() async {
      final snapshot = await collectionRef(
        companyId,
      ).where('laundryItemId', isEqualTo: itemId).get();

      return snapshot.docs.map((doc) => fromMap(doc.data(), doc.id)).toList();
    });
  }

  // =========================
  // DELETE BY ITEM ID
  // =========================

  Future<void> deleteByItemId({
    required String companyId,
    required String itemId,
  }) async {
    return safeCall(() async {
      final snapshot = await collectionRef(
        companyId,
      ).where('laundryItemId', isEqualTo: itemId).get();

      final batch = firestore.batch();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    });
  }
}
