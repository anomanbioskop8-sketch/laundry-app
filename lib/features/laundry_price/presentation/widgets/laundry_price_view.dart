import 'package:app_laundry/core/base/builders/base_stream_builder.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/presentation/cubit/laundry_price_cubit.dart';
import 'package:app_laundry/features/laundry_price/presentation/widgets/laundry_price_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LaundryPriceView extends StatelessWidget {
  final LaundrySpeedType speedType;

  const LaundryPriceView({super.key, required this.speedType});

  @override
  Widget build(BuildContext context) {
    return BaseStreamBuilder<LaundryPriceCubit, LaundryPriceEntity>(
      builder: (items) {
        /// =========================
        /// FILTER
        /// =========================

        final filteredItems = context
            .read<LaundryPriceCubit>()
            .filterByServiceType(items, speedType);

        return ListView.separated(
          itemCount: filteredItems.length,

          itemBuilder: (_, i) {
            final item = filteredItems[i];

            return LaundryPriceListItem(price: item);
          },

          separatorBuilder: (_, i) => const Divider(),
        );
      },
    );
  }
}
