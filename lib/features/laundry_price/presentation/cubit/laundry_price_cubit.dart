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

import 'package:app_laundry/core/base/stream/base_search_cubit.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:app_laundry/features/laundry_price/domain/entities/laundry_price_entity.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/stream_laundry_prices.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/stream_laundry_prices_by_service_and_speed.dart';

class LaundryPriceCubit extends BaseSearchCubit<LaundryPriceEntity> {
  final StreamLaundryPrices _streamLaundryPrices;
  final StreamLaundryPricesByServiceAndSpeed
  _streamLaundryPricesByServiceAndSpeed;

  LaundryPriceCubit({
    required StreamLaundryPrices streamLaundryPrices,
    required StreamLaundryPricesByServiceAndSpeed
    streamLaundryPricesByServiceAndSpeed,
  }) : _streamLaundryPrices = streamLaundryPrices,
       _streamLaundryPricesByServiceAndSpeed =
           streamLaundryPricesByServiceAndSpeed;

  @override
  List<FieldSelector<LaundryPriceEntity>> get searchFields => [(c) => c.id];

  /// Mendengarkan perubahan data laundry item secara realtime
  void listenLaundryItems(String laundryItemId) {
    listen(() => _streamLaundryPrices(laundryItemId));
  }

  void listenLaundryItemsByServiceAndSpeed({
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
  }) {
    listen(
      () => _streamLaundryPricesByServiceAndSpeed(
        serviceType: serviceType,
        speedType: speedType,
      ),
    );
  }

  List<LaundryPriceEntity> filterByServiceType(
    List<LaundryPriceEntity> items,
    LaundrySpeedType type,
  ) {
    return items.where((e) => e.speedType == type).toList()..sort((a, b) {
      return a.speedType.label.compareTo(b.speedType.label);
    });
  }
}
