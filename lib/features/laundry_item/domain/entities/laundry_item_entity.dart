import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';

class LaundryItemEntity {
  final String id;
  final String name;
  final LaundryItemCategory category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LaundryItemEntity({
    required this.id,
    required this.name,
    required this.category,
    this.createdAt,
    this.updatedAt,
  });
}
