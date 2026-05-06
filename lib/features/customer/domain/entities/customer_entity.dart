class CustomerEntity {
  final String id;
  final String name;
  final String phone;
  final String address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    this.createdAt,
    this.updatedAt,
  });
}
