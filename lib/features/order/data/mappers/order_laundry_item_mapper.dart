// =============================================================================
// File        : order_laundry_item_mapper.dart
// Path        : lib/features/order/data/mappers/order_laundry_item_mapper.dart
// Layer       : Data (Mapper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mapping OrderLaundryItemModel <-> OrderLaundryItemEntity
// =============================================================================

import 'package:app_laundry/features/laundry_item/domain/extensions/laundry_item_category_ext.dart';
import 'package:app_laundry/features/laundry_item/domain/extensions/string_laundry_item_category_ext.dart';
import 'package:app_laundry/features/order/data/models/order_laundry_item_model.dart';

import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class OrderLaundryItemMapper {
  // =========================
  // MODEL → ENTITY
  // =========================

  static OrderLaundryItemEntity toEntity(OrderLaundryItemModel model) {
    return OrderLaundryItemEntity(
      itemId: model.laundryItemId,
      itemName: model.laundryItemName,
      qty: model.quantity,
      price: model.price,
      category: model.category.toLaundryItemCategory,
    );
  }

  // =========================
  // ENTITY → MODEL
  // =========================

  static OrderLaundryItemModel toModel(OrderLaundryItemEntity entity) {
    return OrderLaundryItemModel(
      laundryItemId: entity.itemId,
      laundryItemName: entity.itemName,
      quantity: entity.qty,
      price: entity.price,
      category: entity.category.value,
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
