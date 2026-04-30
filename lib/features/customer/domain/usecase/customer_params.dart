/// =========================
/// CREATE CUSTOMER
/// =========================
class CreateCustomerParams {
  final String name;
  final String phone;

  const CreateCustomerParams({required this.name, required this.phone});

  bool get isValid => name.isNotEmpty && phone.isNotEmpty;
}

/// =========================
/// UPDATE CUSTOMER
/// =========================
class UpdateCustomerParams {
  final String id;
  final String name;
  final String phone;

  const UpdateCustomerParams({
    required this.id,
    required this.name,
    required this.phone,
  });

  bool get isValid => id.isNotEmpty && name.isNotEmpty && phone.isNotEmpty;
}

/// =========================
/// DELETE CUSTOMER
/// =========================
class DeleteCustomerParams {
  final String id;

  const DeleteCustomerParams(this.id);

  bool get isValid => id.isNotEmpty;
}

/// =========================
/// GET CUSTOMER
/// =========================
class GetCustomerParams {
  final String id;

  const GetCustomerParams(this.id);

  bool get isValid => id.isNotEmpty;
}

class SaveCustomerParams {
  final String? id;
  final String name;
  final String phone;

  const SaveCustomerParams({this.id, required this.name, required this.phone});

  bool get isEdit => id != null;

  bool get isValid => name.isNotEmpty && phone.isNotEmpty;
}
