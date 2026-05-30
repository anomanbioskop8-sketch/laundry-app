// =============================================================================
// File        : customer_field_widget.dart
// Path        : lib/features/order/presentation/widgets/customer_field_widget.dart
// Layer       : Presentation (Form Field)
// -----------------------------------------------------------------------------
// Fungsi:
// - Field picker untuk memilih customer pada form Order
// - Membuka halaman customer picker
// - Menampilkan customer yang dipilih
// - Mendukung clear selected customer
// =============================================================================

import 'package:app_laundry/app/router/extensions/push/customer_navigation_ext.dart';
import 'package:app_laundry/core/constants/app_icons.dart';
import 'package:app_laundry/core/theme/helpers/text_style_color_scheme_ext.dart';
import 'package:app_laundry/core/theme/helpers/text_style_weight_ext.dart';
import 'package:app_laundry/core/theme/helpers/theme_ext.dart';
import 'package:app_laundry/core/ui/components/app_selected_item.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:flutter/material.dart';

class CustomerFieldWidget extends StatelessWidget {
  final CustomerEntity? customer;
  final ValueChanged<CustomerEntity> onChanged;
  final VoidCallback? onClear;

  const CustomerFieldWidget({
    super.key,
    required this.customer,
    required this.onChanged,
    this.onClear,
  });

  // =========================
  // PICK CUSTOMER
  // =========================

  Future<void> _pickCustomer(BuildContext context) async {
    final result = await context.goCustomer(isPicker: true);

    if (result is CustomerEntity) {
      onChanged(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedCustomer = customer;
    final hasCustomer = selectedCustomer != null;

    return AppSelectedItem(
      leading: Icon(
        AppIcons.customers,
        color: context.colors.primary,
        size: context.sizes.iconMd,
      ),
      title: hasCustomer ? selectedCustomer.name : 'Pilih Customer',
      subtitle: hasCustomer
          ? selectedCustomer.phone
          : 'Belum ada customer dipilih',
      titleStyle: hasCustomer
          ? context.bodyMedium!.semiBold.onSurface(context)
          : context.bodyMedium!.semiBold.primary(context),
      subtitleStyle: context.bodySmall!.onSurfaceVariant(context),
      onTap: () {
        _pickCustomer(context);
      },
    );
  }
}
