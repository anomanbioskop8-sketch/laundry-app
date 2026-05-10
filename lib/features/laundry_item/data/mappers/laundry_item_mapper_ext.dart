import 'package:app_laundry/features/laundry_item/data/mappers/laundry_item_mapper.dart';
import 'package:app_laundry/features/laundry_item/data/models/laundry_item_model.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';

/// =========================
/// MODEL -> ENTITY
/// =========================

extension LaundryItemModelExt on LaundryItemModel {
  LaundryItemEntity get toEntity {
    return LaundryItemMapper.toEntity(this);
  }
}

/// =========================
/// ENTITY -> MODEL
/// =========================

extension LaundryItemEntityExt on LaundryItemEntity {
  LaundryItemModel get toModel {
    return LaundryItemMapper.toModel(this);
  }
}

/// =========================
/// MODEL LIST -> ENTITY LIST
/// =========================

extension LaundryItemModelListExt on List<LaundryItemModel> {
  List<LaundryItemEntity> get toEntities {
    return map((e) => e.toEntity).toList();
  }
}

/// =========================
/// ENTITY LIST -> MODEL LIST
/// =========================

extension LaundryItemEntityListExt on List<LaundryItemEntity> {
  List<LaundryItemModel> get toModels {
    return map((e) => e.toModel).toList();
  }
}
