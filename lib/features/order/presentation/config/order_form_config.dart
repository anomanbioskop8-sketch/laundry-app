import 'package:app_laundry/core/form/configs/form_field_config.dart';
import 'package:app_laundry/core/form/configs/form_field_type.dart';
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/presentation/controllers/order_form_controller.dart';
import 'package:app_laundry/features/order/presentation/widgets/customer_selection_field.dart';
import 'package:app_laundry/features/order/presentation/widgets/order_group/order_group_field/order_group_field.dart';

class OrderFormConfig {
  final OrderFormController controller;
  final List<CustomerEntity> customers;

  OrderFormConfig({required this.controller, required this.customers});

  // =========================
  // BUILD FIELDS
  // =========================

  List<FormFieldConfig> get fields {
    return [
      // =========================
      // CUSTOMER
      // =========================
      FormFieldConfig(
        name: 'customer',
        label: OrderStrings.customer,
        type: FormFieldType.custom,
        controller: controller.customerId,
        customBuilder: (context) {
          return CustomerSelectionField();
        },
      ),

      // =========================
      // PAYMENT STATUS
      // =========================
      FormFieldConfig(
        name: 'paymentStatus',
        label: OrderStrings.paymentStatus,
        initialValue: true,
        type: FormFieldType.dropdown,
        controller: controller.paymentStatus,
        prefixIcon: controller.selectedPaymentStatus.icon,
        options: PaymentStatusExt.options,
      ),

      FormFieldConfig(
        name: 'groups',
        label: '',
        type: FormFieldType.custom,
        controller: controller.groups,
        customBuilder: (_) {
          return OrderGroupField();
        },
      ),
    ];
  }
}
