// =============================================================================
// File        : setting_mapper_ext.dart
// Path        : lib/features/setting/data/mappers/setting_mapper_ext.dart
// Layer       : Data (Mapper)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mapper SettingModel <-> SettingEntity
// =============================================================================

import 'package:app_laundry/features/setting/data/models/setting_model.dart';

import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

extension SettingModelMapperExt on SettingModel {
  // =========================
  // TO ENTITY
  // =========================

  SettingEntity get toEntity {
    return SettingEntity(
      id: id,

      regularPrice: regularPrice,

      expressPrice: expressPrice,

      regularEstimation: regularEstimation,

      expressEstimation: expressEstimation,

      createdAt: createdAt,

      updatedAt: updatedAt,
    );
  }
}

extension SettingEntityMapperExt on SettingEntity {
  // =========================
  // TO MODEL
  // =========================

  SettingModel get toModel {
    return SettingModel(
      id: id,

      regularPrice: regularPrice,

      expressPrice: expressPrice,

      regularEstimation: regularEstimation,

      expressEstimation: expressEstimation,

      createdAt: createdAt,

      updatedAt: updatedAt,
    );
  }
}
