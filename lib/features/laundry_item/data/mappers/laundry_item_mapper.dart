import 'package:app_laundry/features/laundry_item/data/models/laundry_item_model.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';
import 'package:app_laundry/features/laundry_item/domain/extensions/string_laundry_item_category_ext.dart';

class LaundryItemMapper {
  /// Model → Entity
  static LaundryItemEntity toEntity(LaundryItemModel model) {
    return LaundryItemEntity(
      id: model.id,
      name: model.name,
      category: model.category.toLaundryItemCategory,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  /// Entity → Model
  static LaundryItemModel toModel(LaundryItemEntity entity) {
    return LaundryItemModel(
      id: entity.id,
      name: entity.name,
      category: entity.category.value,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  /// List Model → List Entity
  static List<LaundryItemEntity> toEntityList(List<LaundryItemModel> models) {
    return models.map(toEntity).toList();
  }
}
