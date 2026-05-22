import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

class SettingParams {
  final SettingEntity current;

  final int regularPrice;

  final int expressPrice;

  final int regularEstimation;

  final int expressEstimation;

  const SettingParams({
    required this.current,
    required this.regularPrice,
    required this.expressPrice,
    required this.regularEstimation,
    required this.expressEstimation,
  });
}
