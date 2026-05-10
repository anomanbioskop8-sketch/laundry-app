import 'package:app_laundry/features/laundry_price/data/mappers/laundry_price_mapper.dart';
import 'package:app_laundry/features/laundry_price/data/models/laundry_price_model.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';

/// =========================
/// MODEL -> ENTITY
/// =========================

extension LaundryPriceModelExt on LaundryPriceModel {
  LaundryPriceEntity get toEntity {
    return LaundryPriceMapper.toEntity(this);
  }
}

/// =========================
/// ENTITY -> MODEL
/// =========================

extension LaundryPriceEntityExt on LaundryPriceEntity {
  LaundryPriceModel get toModel {
    return LaundryPriceMapper.toModel(this);
  }
}

/// =========================
/// MODEL LIST -> ENTITY LIST
/// =========================

extension LaundryPriceModelListExt on List<LaundryPriceModel> {
  List<LaundryPriceEntity> get toEntities {
    return map((e) => e.toEntity).toList();
  }
}

/// =========================
/// ENTITY LIST -> MODEL LIST
/// =========================

extension LaundryPriceEntityListExt on List<LaundryPriceEntity> {
  List<LaundryPriceModel> get toModels {
    return map((e) => e.toModel).toList();
  }
}
