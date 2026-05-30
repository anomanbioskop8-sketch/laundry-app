import 'package:app_laundry/core/network/base_crud_remote_datasource.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
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

  Query<Map<String, dynamic>> _itemQueryWithFilters({
    required String companyId,
    required String itemId,
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
  }) {
    return collectionRef(companyId)
        .where('laundryItemId', isEqualTo: itemId)
        .where('serviceType', isEqualTo: serviceType.value)
        .where('speedType', isEqualTo: speedType.value);
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

  Stream<List<LaundryPriceModel>> streamByServiceAndSpeed({
    required String companyId,
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
  }) {
    return streamAll(
      companyId,
      queryBuilder: (query) {
        return query
            .where('serviceType', isEqualTo: serviceType.value)
            .where('speedType', isEqualTo: speedType.value);
      },
    );
  }

  // =========================
  // GET BY ITEM ID
  // =========================

  Future<LaundryPriceModel?> getLaundryPrice({
    required String companyId,
    required String itemId,
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
  }) {
    return safeCall(() async {
      final snapshot = await _itemQueryWithFilters(
        companyId: companyId,
        itemId: itemId,
        serviceType: serviceType,
        speedType: speedType,
      ).limit(1).get();

      if (snapshot.docs.isEmpty) {
        return null;
      }

      final doc = snapshot.docs.first;

      return fromMap(doc.data(), doc.id);
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
