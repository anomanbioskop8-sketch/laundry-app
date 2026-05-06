import 'package:cloud_firestore/cloud_firestore.dart';

class LaundryItemModel {
  final String id;
  final String name;
  final String category;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LaundryItemModel({
    required this.id,
    required this.name,
    required this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory LaundryItemModel.fromMap(Map<String, dynamic> map, String id) {
    return LaundryItemModel(
      id: id,
      name: map['name'] ?? '',
      category: map['category'],
      createdAt: (map['createdAt'] as Timestamp?)?.toDate(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'category': category};
  }
}
