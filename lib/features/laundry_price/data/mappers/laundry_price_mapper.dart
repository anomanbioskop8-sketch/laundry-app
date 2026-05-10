import 'package:app_laundry/features/laundry_price/data/models/laundry_price_model.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/order_type_ext.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';

class LaundryPriceMapper {
  /// Model → Entity
  static LaundryPriceEntity toEntity(LaundryPriceModel model) {
    return LaundryPriceEntity(
      id: model.id,
      laundryItemId: model.laundryItemId,
      orderType: OrderTypeX.fromString(model.orderType),
      serviceType: LaundryServiceTypeX.fromString(model.serviceType),
      price: model.price,
      createdAt: model.createdAt,
      updatedAt: model.createdAt,
    );
  }

  /// Entity → Model
  static LaundryPriceModel toModel(LaundryPriceEntity entity) {
    return LaundryPriceModel(
      id: entity.id,
      laundryItemId: entity.laundryItemId,
      orderType: entity.orderType.value,
      serviceType: entity.serviceType.value,
      price: entity.price,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// List Model → List Entity
  static List<LaundryPriceEntity> toEntityList(List<LaundryPriceModel> models) {
    return models.map(toEntity).toList();
  }
}
