import 'package:app_laundry/core/extensions/timestamp_ext.dart';

class CustomerModel {
  final String id;
  final String name;
  final String phone;
  final String address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory CustomerModel.fromMap(Map<String, dynamic> map, String id) {
    return CustomerModel(
      id: id,
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      createdAt: map.timestamp('createdAt'),
      updatedAt: map.timestamp('updatedAt'),
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'phone': phone, 'address': address};
  }
}
