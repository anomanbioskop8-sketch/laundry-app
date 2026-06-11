import 'package:app_laundry/core/extensions/timestamp_ext.dart';

class SettingModel {
  // =========================
  // ID
  // =========================

  final String id;

  // =========================
  // PRICE
  // =========================

  final int regularPrice;
  final int expressPrice;
  final int sameDayPrice;

  // =========================
  // ESTIMATION (DAY)
  // =========================

  final int regularEstimation;
  final int expressEstimation;
  final int sameDayEstimation;

  // =========================
  // AUDIT
  // =========================

  final DateTime? createdAt;
  final DateTime? updatedAt;

  const SettingModel({
    required this.id,
    required this.regularPrice,
    required this.expressPrice,
    required this.sameDayPrice,
    required this.regularEstimation,
    required this.expressEstimation,
    required this.sameDayEstimation,
    this.createdAt,
    this.updatedAt,
  });

  factory SettingModel.fromMap(Map<String, dynamic> map, String id) {
    return SettingModel(
      id: id,
      regularPrice: map['regularPrice'] ?? 0,
      expressPrice: map['expressPrice'] ?? 0,
      sameDayPrice: map['sameDayPrice'] ?? 0,
      regularEstimation: map['regularEstimation'] ?? 0,
      expressEstimation: map['expressEstimation'] ?? 0,
      sameDayEstimation: map['sameDayEstimation'] ?? 0,
      createdAt: map.timestamp('createdAt'),
      updatedAt: map.timestamp('updatedAt'),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'regularPrice': regularPrice,
      'expressPrice': expressPrice,
      'sameDayPrice': sameDayPrice,
      'regularEstimation': regularEstimation,
      'expressEstimation': expressEstimation,
      'sameDayEstimation': sameDayEstimation,
    };
  }
}
