import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_info_card.dart';
import 'package:app_laundry/core/ui/components/info_info_item.dart';
import 'package:flutter/material.dart';

class InfoPriceView extends StatelessWidget {
  const InfoPriceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(context.spacing.lg),
      child: AppInfoCard(
        items: [
          AppInfoItem(icon: Icons.person, label: 'Service', value: '5000'),
          AppInfoItem(icon: Icons.person, label: 'Service', value: '5000'),
          AppInfoItem(icon: Icons.person, label: 'Service', value: '5000'),
          AppInfoItem(icon: Icons.person, label: 'Service', value: '5000'),
        ],
      ),
    );
  }
}
