import 'package:app_laundry/core/network/base_crud_remote_datasource.dart';
import 'package:app_laundry/features/laundry_price/data/models/laundry_price_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LaundryPriceRemoteDataSource
    extends BaseCrudRemoteDataSource<LaundryPriceModel> {
  LaundryPriceRemoteDataSource(super.logger, {required super.firestore});

  // =========================
  // COLLECTION
  // =========================

  @override
  String get collection => 'laundry_prices';

  // =========================
  // MAPPER
  // =========================

  @override
  LaundryPriceModel fromMap(Map<String, dynamic> map, String id) {
    return LaundryPriceModel.fromMap(map, id);
  }

  @override
  Map<String, dynamic> toMap(LaundryPriceModel data) {
    return data.toMap();
  }

  // =========================
  // QUERY
  // =========================

  Query<Map<String, dynamic>> _itemQuery({
    required String companyId,
    required String itemId,
  }) {
    return collectionRef(companyId).where('laundryItemId', isEqualTo: itemId);
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
  }) {
    return safeCall(() async {
      final snapshot = await _itemQuery(
        companyId: companyId,
        itemId: itemId,
      ).get();

      return snapshot.docs.map((doc) {
        return fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  // =========================
  // DELETE BY ITEM ID
  // =========================

  Future<void> deleteByItemId({
    required String companyId,
    required String itemId,
  }) {
    return safeCall(() async {
      final snapshot = await _itemQuery(
        companyId: companyId,
        itemId: itemId,
      ).get();

      final batch = firestore.batch();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    });
  }
}
