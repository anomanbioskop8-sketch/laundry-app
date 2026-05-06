import 'package:app_laundry/features/auth/data/mappers/user_mapper.dart';
import 'package:app_laundry/features/auth/data/models/user_model.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

extension UserModelX on UserModel {
  UserEntity toEntity() => UserMapper.toEntity(this);
}

extension UserEntityX on UserEntity {
  UserModel toModel() => UserMapper.toModel(this);
}
