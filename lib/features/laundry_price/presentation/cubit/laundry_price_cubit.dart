// =============================================================================
// File        : laundry_item_cubit.dart
// Path        : lib/features/laundry_item/presentation/cubit/laundry_item_cubit.dart
// Layer       : Presentation (Cubit)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengelola state dan pencarian data laundry item
// - Mendengarkan perubahan data laundry item secara realtime
// - Menyediakan field pencarian berdasarkan nama laundry item
// - Menghubungkan Presentation Layer dengan use case `StreamLaundryItems`
// =============================================================================

import 'package:app_laundry/core/base/cubit/base_search_cubit.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry_price/domain/enums/order_type_ext.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/stream_laundry_prices.dart';

class LaundryPriceCubit extends BaseSearchCubit<LaundryPriceEntity> {
  final StreamLaundryPrices _streamLaundryPrices;

  LaundryPriceCubit(StreamLaundryPrices streamLaundryPrices)
    : _streamLaundryPrices = streamLaundryPrices;

  @override
  List<FieldSelector<LaundryPriceEntity>> get searchFields => [(c) => c.id];

  /// Mendengarkan perubahan data laundry item secara realtime
  void listenLaundryItems(String laundryItemId) {
    listen(() => _streamLaundryPrices(laundryItemId));
  }

  List<LaundryPriceEntity> filterByServiceType(
    List<LaundryPriceEntity> items,
    LaundryServiceType type,
  ) {
    return items.where((e) => e.serviceType == type).toList()..sort((a, b) {
      return a.orderType.label.compareTo(b.orderType.label);
    });
  }
}
