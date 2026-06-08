import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';

class BuildOrderGroup {
  OrderGroupEntity call({
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
    required LaundryOrderType orderType,
    required List<OrderLaundryItemEntity> items,
    required double weight,
    required int price,
  }) {
    // =========================
    // VALIDATION
    // =========================

    if (orderType.isKg && weight <= 0) {
      throw ValidationException(OrderStrings.weightRequired);
    }

    if (orderType.isPcs && items.isEmpty) {
      throw ValidationException(OrderStrings.itemRequired);
    }

    return OrderGroupEntity(
      serviceType: serviceType,
      speedType: speedType,
      orderType: orderType,
      items: items,
      weight: orderType.isKg ? weight : 0,
      price: price,
    );
  }
}
