import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
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
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.md),
      child: AppInfoCard(
        items: [
          AppInfoItem(
            label: CustomerStrings.title,
            icon: AppIcons.customer,
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
            value: order.formattedCreatedAt,
          ),
          AppInfoItem(
            label: 'Estimasi Selesai',
            icon: AppIcons.estimation,
            value: order.formattedEstimatedFinishAt,
          ),
        ],
      ),
    );
  }
}
