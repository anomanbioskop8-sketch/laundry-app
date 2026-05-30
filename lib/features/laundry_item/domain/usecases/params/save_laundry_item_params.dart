import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';

class SaveLaundryItemParams {
  final String? id;
  final String name;
  final LaundryItemCategory category;

  const SaveLaundryItemParams({
    this.id,
    required this.name,
    required this.category,
  });

  bool get isEdit => id != null;

  bool get isValid => name.isNotEmpty;
}
