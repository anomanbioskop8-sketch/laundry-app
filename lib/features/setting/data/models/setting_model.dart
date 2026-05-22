import 'package:app_laundry/core/extensions/timestamp_ext.dart';

class SettingModel {
  final String id;

  final int regularPrice;

  final int expressPrice;

  final int regularEstimation;

  final int expressEstimation;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  const SettingModel({
    required this.id,
    required this.regularPrice,
    required this.expressPrice,
    required this.regularEstimation,
    required this.expressEstimation,
    this.createdAt,
    this.updatedAt,
  });

  factory SettingModel.fromMap(Map<String, dynamic> map, String id) {
    return SettingModel(
      id: id,
      regularPrice: map['regularPrice'] ?? 0,
      expressPrice: map['expressPrice'] ?? 0,
      regularEstimation: map['regularEstimation'] ?? 0,
      expressEstimation: map['expressEstimation'] ?? 0,
      createdAt: map.timestamp('createdAt'),
      updatedAt: map.timestamp('updatedAt'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'regularPrice': regularPrice,
      'expressPrice': expressPrice,
      'regularEstimation': regularEstimation,
      'expressEstimation': expressEstimation,
    };
  }
}
