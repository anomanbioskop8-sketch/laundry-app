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
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/stream_orders.dart';

class OrderCubit extends BaseSearchCubit<OrderEntity> {
  final StreamOrders _streamOrders;

  OrderCubit(StreamOrders streamOrders) : _streamOrders = streamOrders;

  @override
  List<FieldSelector<OrderEntity>> get searchFields => [(c) => c.invoiceNumber];

  /// Mendengarkan perubahan data laundry item secara realtime
  void listenOrders() {
    listen(() => _streamOrders());
  }
}
