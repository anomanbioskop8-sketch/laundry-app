import 'package:app_laundry/features/setting/domain/entities/setting_entity.dart';
import 'package:app_laundry/features/setting/domain/usecases/setting_params.dart';

extension SettingParamsExt on SettingParams {
  SettingEntity get toEntity {
    return current.copyWith(
      regularPrice: regularPrice,
      expressPrice: expressPrice,
      regularEstimation: regularEstimation,
      expressEstimation: expressEstimation,
    );
  }
}
