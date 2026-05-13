// =============================================================================
// File        : order_laundry_item_mapper.dart
// Path        : lib/features/order/data/mappers/order_laundry_item_mapper.dart
// Layer       : Data (Mapper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mapping OrderLaundryItemModel <-> OrderLaundryItemEntity
// =============================================================================

import 'package:app_laundry/features/order/data/models/order_laundry_item_model.dart';

import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class OrderLaundryItemMapper {
  // =========================
  // MODEL → ENTITY
  // =========================

  static OrderLaundryItemEntity toEntity(OrderLaundryItemModel model) {
    return OrderLaundryItemEntity(
      laundryItemId: model.laundryItemId,

      laundryItemName: model.laundryItemName,

      quantity: model.quantity,
    );
  }

  // =========================
  // ENTITY → MODEL
  // =========================

  static OrderLaundryItemModel toModel(OrderLaundryItemEntity entity) {
    return OrderLaundryItemModel(
      laundryItemId: entity.laundryItemId,

      laundryItemName: entity.laundryItemName,

      quantity: entity.quantity,
    );
  }

  // =========================
  // LIST MODEL → ENTITY
  // =========================

  static List<OrderLaundryItemEntity> toEntityList(
    List<OrderLaundryItemModel> models,
  ) {
    return models.map(toEntity).toList();
  }

  // =========================
  // LIST ENTITY → MODEL
  // =========================

  static List<OrderLaundryItemModel> toModelList(
    List<OrderLaundryItemEntity> entities,
  ) {
    return entities.map(toModel).toList();
  }
}
