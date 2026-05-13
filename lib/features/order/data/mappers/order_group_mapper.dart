// =============================================================================
// File        : order_group_mapper.dart
// Path        : lib/features/order/data/mappers/order_group_mapper.dart
// Layer       : Data (Mapper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mapping OrderGroupModel <-> OrderGroupEntity
// =============================================================================

import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_order_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_service_type_ext.dart';

import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_speed_type_ext.dart';

import 'package:app_laundry/features/order/data/mappers/order_laundry_item_mapper.dart';

import 'package:app_laundry/features/order/data/models/order_group_model.dart';

import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

class OrderGroupMapper {
  // =========================
  // MODEL → ENTITY
  // =========================

  static OrderGroupEntity toEntity(OrderGroupModel model) {
    return OrderGroupEntity(
      serviceType: model.serviceType.toLaundryServiceType,

      speedType: model.speedType.toLaundrySpeedType,

      orderType: model.orderType.toLaundryOrderType,

      items: OrderLaundryItemMapper.toEntityList(model.items),

      weight: model.weight,

      totalItems: model.totalItems,

      price: model.price,

      subtotal: model.subtotal,
    );
  }

  // =========================
  // ENTITY → MODEL
  // =========================

  static OrderGroupModel toModel(OrderGroupEntity entity) {
    return OrderGroupModel(
      serviceType: entity.serviceType.value,

      speedType: entity.speedType.value,

      orderType: entity.orderType.value,

      items: OrderLaundryItemMapper.toModelList(entity.items),

      weight: entity.weight,

      totalItems: entity.totalItems,

      price: entity.price,

      subtotal: entity.subtotal,
    );
  }

  // =========================
  // LIST MODEL → ENTITY
  // =========================

  static List<OrderGroupEntity> toEntityList(List<OrderGroupModel> models) {
    return models.map(toEntity).toList();
  }

  // =========================
  // LIST ENTITY → MODEL
  // =========================

  static List<OrderGroupModel> toModelList(List<OrderGroupEntity> entities) {
    return entities.map(toModel).toList();
  }
}
