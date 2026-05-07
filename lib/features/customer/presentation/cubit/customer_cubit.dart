// =============================================================================
// File        : customer_cubit.dart
// Path        : lib/features/customer/presentation/cubit/customer_cubit.dart
// Layer       : Presentation (Cubit)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengelola state dan pencarian data customer
// - Mendengarkan perubahan data customer secara realtime
// - Menyediakan field pencarian berdasarkan nama dan nomor telepon
// - Menghubungkan Presentation Layer dengan Use Case `StreamCustomers`
// =============================================================================

import 'package:app_laundry/core/base/cubit/base_search_cubit.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/stream_customers.dart';

class CustomerCubit extends BaseSearchCubit<CustomerEntity> {
  final StreamCustomers _streamCustomers;

  CustomerCubit(StreamCustomers streamCustomers)
    : _streamCustomers = streamCustomers;

  @override
  List<FieldSelector<CustomerEntity>> get searchFields => [
    (c) => c.name,
    (c) => c.phone,
  ];

  /// Mendengarkan perubahan data customer secara realtime
  void listenCustomers() {
    listen(() => _streamCustomers());
  }
}
