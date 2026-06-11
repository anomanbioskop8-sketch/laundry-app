import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';

extension LaundrySpeedTypeExt on LaundrySpeedType {
  bool get isRegular => this == LaundrySpeedType.regular;

  bool get isExpress => this == LaundrySpeedType.express;

  int priceFrom(SettingEntity setting) {
    return isRegular ? setting.regularPrice : setting.expressPrice;
  }

  Duration estimationFrom(SettingEntity setting) {
    return Duration(
      days: isRegular ? setting.regularEstimation : setting.expressEstimation,
    );
  }
}
