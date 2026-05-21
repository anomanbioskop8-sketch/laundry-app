import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_info_card.dart';
import 'package:app_laundry/core/ui/components/info_info_item.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

import 'package:flutter/material.dart';

class InfoCompanyView extends StatelessWidget {
  final CompanyEntity company;

  const InfoCompanyView({super.key, required this.company});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: context.spacing.md,
        horizontal: context.spacing.lg,
      ),

      child: AppInfoCard(
        items: [
          AppInfoItem(
            icon: Icons.business_outlined,
            label: 'Nama',
            value: company.name,
          ),

          AppInfoItem(
            icon: Icons.email_outlined,
            label: 'Email',
            value: company.email,
          ),

          AppInfoItem(
            icon: Icons.phone_outlined,
            label: 'Telepon',
            value: company.phone,
          ),

          AppInfoItem(
            icon: Icons.location_on_outlined,
            label: 'Alamat',
            value: company.address,
          ),

          AppInfoItem(
            icon: Icons.attach_money_outlined,
            label: 'Currency',
            value: company.currency,
          ),

          AppInfoItem(
            icon: Icons.calendar_today_outlined,
            label: 'Created',
            value: company.createdAt.readable,
          ),

          AppInfoItem(
            icon: Icons.update_outlined,
            label: 'Updated',
            value: company.updatedAt.readable,
          ),
        ],
      ),
    );
  }
}
