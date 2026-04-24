// =============================================================================
// File        : customer_ui_mapper.dart
// Layer       : Presentation (Mapper)
// -----------------------------------------------------------------------------
// Responsibility:
// - Convert Domain Entity → UI Model
// - Keep UI clean from business logic
// =============================================================================

import '../../domain/entities/customer_entity.dart';
import '../models/customer_ui_model.dart';

class CustomerUIMapper {
  static CustomerUIModel toUI(CustomerEntity e) {
    return CustomerUIModel(
      id: e.id,
      name: e.name,
      phone: e.phone,
      address: e.address,
      subtitle: '${e.phone} • ${e.address}',
    );
  }

  static List<CustomerUIModel> toUIList(List<CustomerEntity> list) {
    return list.map(toUI).toList();
  }
}
