import 'package:app_laundry/features/auth/data/models/user_model.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';

class UserMappper {
  /// Model → Entity
  static UserEntity toEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      companyId: model.companyId,
      role: model.role,
    );
  }

  /// Entity → Model
  static UserModel toModel(UserEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      companyId: entity.companyId,
      role: entity.role,
    );
  }

  /// List Model → List Entity
  static List<UserEntity> toEntityList(List<UserModel> models) {
    return models.map(toEntity).toList();
  }
}
