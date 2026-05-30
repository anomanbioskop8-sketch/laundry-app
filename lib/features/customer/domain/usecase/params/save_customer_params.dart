class SaveCustomerParams {
  final String? id;
  final String name;
  final String phone;
  final String address;

  const SaveCustomerParams({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
  });

  /// Menentukan apakah proses adalah edit/update
  bool get isEdit => id != null;

  /// Validasi data customer
  bool get isValid => name.isNotEmpty && phone.isNotEmpty && address.isNotEmpty;
}
