// =============================================================================
// File : setting_entity.dart
// =============================================================================

class SettingEntity {
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

  const SettingEntity({
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

  // =========================
  // COPY WITH
  // =========================

  SettingEntity copyWith({
    String? id,
    int? regularPrice,
    int? expressPrice,
    int? sameDayPrice,
    int? regularEstimation,
    int? expressEstimation,
    int? sameDayEstimation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SettingEntity(
      id: id ?? this.id,
      regularPrice: regularPrice ?? this.regularPrice,
      expressPrice: expressPrice ?? this.expressPrice,
      sameDayPrice: sameDayPrice ?? this.sameDayPrice,
      regularEstimation: regularEstimation ?? this.regularEstimation,
      expressEstimation: expressEstimation ?? this.expressEstimation,
      sameDayEstimation: sameDayEstimation ?? this.sameDayEstimation,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
