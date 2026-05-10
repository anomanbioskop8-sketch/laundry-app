import 'package:app_laundry/features/laundry_item/domain/enums/laundry_item_category.dart';

/// =========================
/// CREATE CUSTOMER
/// =========================
class CreateLaundryItemParams {
  final String name;
  final LaundryItemCategory category;

  const CreateLaundryItemParams({required this.name, required this.category});

  bool get isValid => name.isNotEmpty;
}

/// =========================
/// UPDATE CUSTOMER
/// =========================
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
