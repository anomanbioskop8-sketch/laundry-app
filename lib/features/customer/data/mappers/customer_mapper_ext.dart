import 'package:app_laundry/features/customer/data/mappers/customer_mapper.dart';
import 'package:app_laundry/features/customer/data/models/customer_model.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

/// =========================
/// MODEL -> ENTITY
/// =========================

extension CustomerModelExt on CustomerModel {
  CustomerEntity get toEntity {
    return CustomerMapper.toEntity(this);
  }
}

/// =========================
/// ENTITY -> MODEL
/// =========================

extension CustomerEntityExt on CustomerEntity {
  CustomerModel get toModel {
    return CustomerMapper.toModel(this);
  }
}

/// =========================
/// MODEL LIST -> ENTITY LIST
/// =========================

extension CustomerModelListExt on List<CustomerModel> {
  List<CustomerEntity> get toEntities {
    return CustomerMapper.toEntityList(this);
  }
}

/// =========================
/// ENTITY LIST -> MODEL LIST
/// =========================

extension CustomerEntityListExt on List<CustomerEntity> {
  List<CustomerModel> get toModels {
    return CustomerMapper.toModelList(this);
  }
}
