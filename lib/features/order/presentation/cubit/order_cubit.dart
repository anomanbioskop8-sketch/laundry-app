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
import 'package:app_laundry/features/order/domain/entities/order_with_customer_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/stream_order_orchestration.dart';

class OrderCubit extends BaseSearchCubit<OrderWithCustomerEntity> {
  final StreamOrderOrchestration _streamOrders;

  OrderCubit(StreamOrderOrchestration streamOrders)
    : _streamOrders = streamOrders;

  @override
  List<FieldSelector<OrderWithCustomerEntity>> get searchFields => [
    (c) => c.order.invoiceNumber,
    (c) => c.customer!.name,
  ];

  /// Mendengarkan perubahan data laundry item secara realtime
  void listenOrders() {
    listen(() => _streamOrders());
  }
}
