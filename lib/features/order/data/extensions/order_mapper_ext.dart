import 'package:app_laundry/features/order/data/mappers/order_mapper.dart';
import 'package:app_laundry/features/order/data/models/order_model.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

/// =========================
/// MODEL -> ENTITY
/// =========================

extension OrderModelExt on OrderModel {
  OrderEntity get toEntity {
    return OrderMapper.toEntity(this);
  }
}

/// =========================
/// ENTITY -> MODEL
/// =========================

extension OrderEntityExt on OrderEntity {
  OrderModel get toModel {
    return OrderMapper.toModel(this);
  }
}

/// =========================
/// MODEL LIST -> ENTITY LIST
/// =========================

extension OrderModelListExt on List<OrderModel> {
  List<OrderEntity> get toEntities {
    return map((e) => e.toEntity).toList();
  }
}

/// =========================
/// ENTITY LIST -> MODEL LIST
/// =========================

extension OrderEntityListExt on List<OrderEntity> {
  List<OrderModel> get toModels {
    return map((e) => e.toModel).toList();
  }
}
