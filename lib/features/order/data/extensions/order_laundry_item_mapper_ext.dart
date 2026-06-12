// =============================================================================
// File        : order_laundry_item_mapper_ext.dart
// Path        : lib/features/order/data/mappers/order_laundry_item_mapper_ext.dart
// =============================================================================

import 'package:app_laundry/features/order/data/mappers/order_laundry_item_mapper.dart';

import 'package:app_laundry/features/order/data/models/order_laundry_item_model.dart';

import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

extension OrderLaundryItemModelListX on List<OrderLaundryItemModel> {
  List<OrderLaundryItemEntity> get toEntities {
    return OrderLaundryItemMapper.toEntityList(this);
  }
}

extension OrderLaundryItemEntityListX on List<OrderLaundryItemEntity> {
  List<OrderLaundryItemModel> get toModels {
    return OrderLaundryItemMapper.toModelList(this);
  }
}
