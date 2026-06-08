import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/theme/theme_extensions.dart';
import 'package:app_laundry/core/ui/widgets/cards/info_card/app_info_card.dart';
import 'package:app_laundry/core/ui/widgets/cards/info_card/app_info_item.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:flutter/material.dart';

class InfoCustomerView extends StatelessWidget {
  final CustomerEntity customer;

  const InfoCustomerView({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.md),
      child: AppInfoCard(
        items: [
          AppInfoItem(
            icon: AppIcons.user,
            label: CustomerStrings.name,
            value: customer.name,
          ),
          AppInfoItem(
            icon: AppIcons.phone,
            label: CustomerStrings.phone,
            value: customer.phone,
          ),
          AppInfoItem(
            icon: AppIcons.createdAt,
            label: 'Created',
            value: customer.createdAt.readable,
          ),
          AppInfoItem(
            icon: AppIcons.updatedAt,
            label: 'Update',
            value: customer.updatedAt.readable,
          ),
        ],
      ),
    );
  }
}
