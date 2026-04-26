class CustomerModel {
  final String id;
  final String companyId;
  final String name;
  final String email;
  final String phone;

  CustomerModel({
    required this.id,
    required this.companyId,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map, String id) {
    return CustomerModel(
      id: id,
      companyId: map['companyId'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyId': companyId,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
