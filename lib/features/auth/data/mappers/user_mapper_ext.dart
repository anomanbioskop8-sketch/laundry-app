import 'package:app_laundry/features/auth/data/mappers/user_mapper.dart';
import 'package:app_laundry/features/auth/data/models/user_model.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

/// =========================
/// MODEL -> ENTITY
/// =========================

extension UserModelExt on UserModel {
  UserEntity get toEntity {
    return UserMapper.toEntity(this);
  }
}

/// =========================
/// ENTITY -> MODEL
/// =========================

extension UserEntityExt on UserEntity {
  UserModel get toModel {
    return UserMapper.toModel(this);
  }
}

/// =========================
/// MODEL LIST -> ENTITY LIST
/// =========================

extension UserModelListExt on List<UserModel> {
  List<UserEntity> get toEntities {
    return map((e) => e.toEntity).toList();
  }
}

/// =========================
/// ENTITY LIST -> MODEL LIST
/// =========================

extension UserEntityListExt on List<UserEntity> {
  List<UserModel> get toModels {
    return map((e) => e.toModel).toList();
  }
}
