import 'package:app_laundry/features/customer/data/models/customer_model.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

class CustomerMapper {
  /// Model → Entity
  static CustomerEntity toEntity(CustomerModel model) {
    return CustomerEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      address: model.address,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  /// Entity → Model
  static CustomerModel toModel(CustomerEntity entity) {
    return CustomerModel(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// List Model → List Entity
  static List<CustomerEntity> toEntityList(List<CustomerModel> models) {
    return models.map(toEntity).toList();
  }

  /// List Model → List Entity
  static List<CustomerModel> toModelList(List<CustomerEntity> entities) {
    return entities.map(toModel).toList();
  }
}
