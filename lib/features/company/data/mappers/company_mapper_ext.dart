// =============================================================================
// File        : company_mapper_ext.dart
// Path        : lib/features/company/data/mappers/company_mapper_ext.dart
// Layer       : Data (Mapper Extension)
// -----------------------------------------------------------------------------
// Fungsi:
// - Extension helper Company mapper
// =============================================================================

import 'package:app_laundry/features/company/data/mappers/company_mapper.dart';

import 'package:app_laundry/features/company/data/models/company_model.dart';

import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

extension CompanyModelMapperExt on CompanyModel {
  CompanyEntity get toEntity {
    return CompanyMapper.toEntity(this);
  }
}

extension CompanyEntityMapperExt on CompanyEntity {
  CompanyModel get toModel {
    return CompanyMapper.toModel(this);
  }
}

extension CompanyModelListMapperExt on List<CompanyModel> {
  List<CompanyEntity> get toEntities {
    return map((e) => e.toEntity).toList();
  }
}

extension CompanyEntityListMapperExt on List<CompanyEntity> {
  List<CompanyModel> get toModels {
    return map((e) => e.toModel).toList();
  }
}
