// =============================================================================
// File        : company_mapper.dart
// Path        : lib/features/company/data/mappers/company_mapper.dart
// Layer       : Data (Mapper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mapping CompanyModel <-> CompanyEntity
// =============================================================================

import 'package:app_laundry/features/company/data/models/company_model.dart';

import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

class CompanyMapper {
  // =========================
  // MODEL -> ENTITY
  // =========================

  static CompanyEntity toEntity(CompanyModel model) {
    return CompanyEntity(
      id: model.id,

      name: model.name,

      email: model.email,

      phone: model.phone,

      address: model.address,

      currency: model.currency,

      createdAt: model.createdAt,

      updatedAt: model.updatedAt,
    );
  }

  // =========================
  // ENTITY -> MODEL
  // =========================

  static CompanyModel toModel(CompanyEntity entity) {
    return CompanyModel(
      id: entity.id,

      name: entity.name,

      email: entity.email,

      phone: entity.phone,

      address: entity.address,

      currency: entity.currency,

      createdAt: entity.createdAt,

      updatedAt: entity.updatedAt,
    );
  }

  // =========================
  // LIST MODEL -> ENTITY
  // =========================

  static List<CompanyEntity> toEntityList(List<CompanyModel> models) {
    return models.map(toEntity).toList();
  }

  // =========================
  // LIST ENTITY -> MODEL
  // =========================

  static List<CompanyModel> toModelList(List<CompanyEntity> entities) {
    return entities.map(toModel).toList();
  }
}
