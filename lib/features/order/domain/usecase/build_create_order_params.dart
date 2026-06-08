// =============================================================================
// File : build_create_order_params.dart
// Path : features/order/domain/usecase/build_create_order_params.dart
// =============================================================================

import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';

class BuildCreateOrderParams {
  const BuildCreateOrderParams();

  CreateOrderParams call({
    required CustomerEntity? customer,
    required List<OrderGroupEntity> groups,
    required PaymentStatus paymentStatus,
  }) {
    if (customer == null) {
      throw ValidationException(OrderStrings.customerRequired);
    }

    if (groups.isEmpty) {
      throw ValidationException(OrderStrings.orderGroupRequired);
    }

    return CreateOrderParams(
      customer: customer,
      groups: groups,
      paymentStatus: paymentStatus,
    );
  }
}
