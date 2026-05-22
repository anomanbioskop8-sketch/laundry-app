class SettingEntity {
  final String id;

  final int regularPrice;

  final int expressPrice;

  final int regularEstimation;

  final int expressEstimation;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  const SettingEntity({
    required this.id,
    required this.regularPrice,
    required this.expressPrice,
    required this.regularEstimation,
    required this.expressEstimation,
    this.createdAt,
    this.updatedAt,
  });

  SettingEntity copyWith({
    String? id,
    int? regularPrice,
    int? expressPrice,
    int? regularEstimation,
    int? expressEstimation,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SettingEntity(
      id: id ?? this.id,
      regularPrice: regularPrice ?? this.regularPrice,
      expressPrice: expressPrice ?? this.expressPrice,
      regularEstimation: regularEstimation ?? this.regularEstimation,
      expressEstimation: expressEstimation ?? this.expressEstimation,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
