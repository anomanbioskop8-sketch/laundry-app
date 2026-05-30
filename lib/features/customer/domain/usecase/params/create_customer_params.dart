class CreateCustomerParams {
  final String name;
  final String phone;
  final String address;

  const CreateCustomerParams({
    required this.name,
    required this.phone,
    required this.address,
  });

  /// Validasi data customer
  bool get isValid => name.isNotEmpty && phone.isNotEmpty && address.isNotEmpty;
}
