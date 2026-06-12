// import 'package:app_laundry/features/order/data/mappers/order_item_mapper.dart';
// import 'package:app_laundry/features/order/data/models/order_item_model.dart';
// import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

// /// =========================
// /// MODEL -> ENTITY
// /// =========================

// extension OrderItemModelExt on OrderItemModel {
//   OrderItemEntity get toEntity {
//     return OrderItemMapper.toEntity(this);
//   }
// }

// /// =========================
// /// ENTITY -> MODEL
// /// =========================

// extension OrderItemEntityExt on OrderItemEntity {
//   OrderItemModel get toModel {
//     return OrderItemMapper.toModel(this);
//   }
// }

// /// =========================
// /// MODEL LIST -> ENTITY LIST
// /// =========================

// extension OrderItemModelListExt on List<OrderItemModel> {
//   List<OrderItemEntity> get toEntities {
//     return map((e) => e.toEntity).toList();
//   }
// }

// /// =========================
// /// ENTITY LIST -> MODEL LIST
// /// =========================

// extension OrderItemEntityListExt on List<OrderItemEntity> {
//   List<OrderItemModel> get toModels {
//     return map((e) => e.toModel).toList();
//   }
// }
