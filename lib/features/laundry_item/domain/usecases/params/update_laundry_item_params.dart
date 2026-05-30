import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';

class UpdateLaundryItemParams {
  final String id;
  final String name;
  final LaundryItemCategory category;

  const UpdateLaundryItemParams({
    required this.id,
    required this.name,
    required this.category,
  });

  bool get isValid => id.isNotEmpty && name.isNotEmpty;
}
