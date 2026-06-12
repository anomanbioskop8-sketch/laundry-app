// =============================================================================
// File        : order_group_mapper_ext.dart
// Path        : lib/features/order/data/mappers/order_group_mapper_ext.dart
// =============================================================================

import 'package:app_laundry/features/order/data/mappers/order_group_mapper.dart';
import 'package:app_laundry/features/order/data/models/order_group_model.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

extension OrderGroupModelListX on List<OrderGroupModel> {
  List<OrderGroupEntity> get toEntities {
    return OrderGroupMapper.toEntityList(this);
  }
}

extension OrderGroupEntityListX on List<OrderGroupEntity> {
  List<OrderGroupModel> get toModels {
    return OrderGroupMapper.toModelList(this);
  }
}
