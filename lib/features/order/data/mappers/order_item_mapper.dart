// import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';

// import 'package:app_laundry/features/laundry/domain/extensions/string_laundry_order_type_ext.dart';

// import 'package:app_laundry/features/order/data/models/order_item_model.dart';

// import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
// import 'package:app_laundry/features/order/domain/entities/order_kg_item_entity.dart';
// import 'package:app_laundry/features/order/domain/entities/order_piece_item_entity.dart';

// class OrderItemMapper {
//   // =========================
//   // MODEL → ENTITY
//   // =========================

//   static OrderItemEntity toEntity(OrderItemModel model) {
//     switch (model.type) {
//       case 'kg':
//         return OrderKgItemEntity(
//           id: model.laundryItemId,

//           name: model.laundryItemName,

//           price: model.price,

//           orderType: model.orderType.toOrderType,

//           weight: model.weight ?? 0,
//         );

//       case 'piece':
//         return OrderPieceItemEntity(
//           id: model.laundryItemId,

//           name: model.laundryItemName,

//           price: model.price,

//           orderType: model.orderType.toOrderType,

//           qty: model.qty ?? 0,
//         );

//       default:
//         throw Exception('Unknown order item type');
//     }
//   }

//   // =========================
//   // ENTITY → MODEL
//   // =========================

//   static OrderItemModel toModel(OrderItemEntity entity) {
//     if (entity is OrderKgItemEntity) {
//       return OrderItemModel(
//         type: 'kg',

//         laundryItemId: entity.id,

//         laundryItemName: entity.name,

//         orderType: entity.orderType.value,

//         weight: entity.weight,

//         price: entity.price,
//       );
//     }

//     if (entity is OrderPieceItemEntity) {
//       return OrderItemModel(
//         type: 'piece',

//         laundryItemId: entity.id,

//         laundryItemName: entity.name,

//         orderType: entity.orderType.value,

//         qty: entity.qty,

//         price: entity.price,
//       );
//     }

//     throw Exception('Unknown order item entity');
//   }

//   // =========================
//   // LIST MODEL → ENTITY
//   // =========================

//   static List<OrderItemEntity> toEntityList(List<OrderItemModel> models) {
//     return models.map(toEntity).toList();
//   }

//   // =========================
//   // LIST ENTITY → MODEL
//   // =========================

//   static List<OrderItemModel> toModelList(List<OrderItemEntity> entities) {
//     return entities.map(toModel).toList();
//   }
// }
