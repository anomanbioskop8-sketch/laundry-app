class CustomerModel {
  final String id;
  final String name;
  final String phone;
  final String address;
  final String companyId;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.companyId,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map, String id) {
    return CustomerModel(
      id: id,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      companyId: map['companyId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'companyId': companyId,
    };
  }
}
