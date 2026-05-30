class UpdateCustomerParams {
  final String id;
  final String name;
  final String phone;
  final String address;

  const UpdateCustomerParams({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
  });

  /// Validasi data update customer
  bool get isValid =>
      id.isNotEmpty &&
      name.isNotEmpty &&
      phone.isNotEmpty &&
      address.isNotEmpty;
}
