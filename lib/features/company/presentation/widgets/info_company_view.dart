import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/constants/strings/company_strings.dart';
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
            icon: AppIcons.company,
            label: CompanyStrings.name,
            value: company.name,
          ),

          AppInfoItem(
            icon: AppIcons.email,
            label: CompanyStrings.email,
            value: company.email,
          ),

          AppInfoItem(
            icon: AppIcons.phone,
            label: CompanyStrings.phone,
            value: company.phone,
          ),

          AppInfoItem(
            icon: AppIcons.address,
            label: CompanyStrings.address,
            value: company.address,
          ),

          AppInfoItem(
            icon: AppIcons.price,
            label: 'Currency',
            value: company.currency,
          ),

          AppInfoItem(
            icon: AppIcons.createdAt,
            label: 'Created',
            value: company.createdAt.readable,
          ),

          AppInfoItem(
            icon: AppIcons.updatedAt,
            label: 'Updated',
            value: company.updatedAt.readable,
          ),
        ],
      ),
    );
  }
}
