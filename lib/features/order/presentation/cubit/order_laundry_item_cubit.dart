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
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';
import 'package:app_laundry/features/order/domain/usecase/stream_order_laundry_items.dart';

class OrderLaundryItemCubit extends BaseSearchCubit<OrderLaundryItemEntity> {
  final StreamOrderLaundryItems _streamOrders;

  OrderLaundryItemCubit(StreamOrderLaundryItems streamOrders)
    : _streamOrders = streamOrders;

  @override
  List<FieldSelector<OrderLaundryItemEntity>> get searchFields => [
    (c) => c.itemName,
  ];

  /// Mendengarkan perubahan data laundry item secara realtime
  void listenOrders(StreamOrderLaundryItemsParams params) {
    listen(() => _streamOrders(params));
  }
}
