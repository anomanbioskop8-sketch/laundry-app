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
