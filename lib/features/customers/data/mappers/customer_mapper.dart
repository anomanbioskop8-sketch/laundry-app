import 'package:app_laundry/features/customers/data/models/customer_model.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';

class CustomerMapper {
  /// Model → Entity
  static CustomerEntity toEntity(CustomerModel model) {
    return CustomerEntity(
      id: model.id,
      name: model.name,
      phone: model.phone,
      address: model.address,
      companyId: model.companyId,
    );
  }

  /// Entity → Model
  static CustomerModel toModel(CustomerEntity entity) {
    return CustomerModel(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      address: entity.address,
      companyId: entity.companyId,
    );
  }

  /// List Model → List Entity
  static List<CustomerEntity> toEntityList(List<CustomerModel> models) {
    return models.map(toEntity).toList();
  }
}
