import 'package:app_laundry/features/order/data/mappers/order_group_mapper.dart';
import 'package:app_laundry/features/order/data/models/order_model.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_status/order_status_display_ext.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_status/order_status_parser_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/string_payment_status_ext.dart';

class OrderMapper {
  // =========================
  // MODEL → ENTITY
  // =========================

  static OrderEntity toEntity(OrderModel model) {
    return OrderEntity(
      id: model.id,
      invoiceNumber: model.invoiceNumber,
      customerId: model.customerId,
      groups: OrderGroupMapper.toEntityList(model.groups),
      orderStatus: model.orderStatus.toOrderStatus,
      paymentStatus: model.paymentStatus.toPaymentStatus,
      total: model.total,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  // =========================
  // ENTITY → MODEL
  // =========================

  static OrderModel toModel(OrderEntity entity) {
    return OrderModel(
      id: entity.id,
      invoiceNumber: entity.invoiceNumber,
      customerId: entity.customerId,
      groups: OrderGroupMapper.toModelList(entity.groups),
      orderStatus: entity.orderStatus.value,
      paymentStatus: entity.paymentStatus.value,
      total: entity.total,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  // =========================
  // LIST MODEL → ENTITY
  // =========================

  static List<OrderEntity> toEntityList(List<OrderModel> models) {
    return models.map(toEntity).toList();
  }

  // =========================
  // LIST ENTITY → MODEL
  // =========================

  static List<OrderModel> toModelList(List<OrderEntity> entities) {
    return entities.map(toModel).toList();
  }
}
