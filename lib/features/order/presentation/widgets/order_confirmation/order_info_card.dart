import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/core/ui/widgets/cards/info_card/app_info_card.dart';
import 'package:app_laundry/core/ui/widgets/cards/info_card/app_info_item.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/create_order_params_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:flutter/material.dart';

class OrderInfoCard extends StatelessWidget {
  final CreateOrderParams order;

  const OrderInfoCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return AppInfoCard(
      items: [
        AppInfoItem(
          label: CustomerStrings.title,
          icon: AppIcons.customers,
          value: order.customer.name,
        ),
        AppInfoItem(
          label: 'Status Pembayaran',
          icon: AppIcons.paid,
          value: order.paymentStatus.label,
        ),
        AppInfoItem(
          label: 'Tanggal Dibuat',
          icon: AppIcons.createdAt,
          value: order.createdAtFormatted,
        ),
        AppInfoItem(
          label: 'Estimasi Selesai',
          icon: AppIcons.schedule,
          value: order.estimatedFinishedAtFormatted,
        ),
      ],
    );
  }
}
