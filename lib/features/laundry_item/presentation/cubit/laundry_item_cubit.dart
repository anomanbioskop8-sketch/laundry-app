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
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/stream_laundry_items.dart';

class LaundryItemCubit extends BaseSearchCubit<LaundryItemEntity> {
  final StreamLaundryItems _streamLaundryItems;

  LaundryItemCubit(StreamLaundryItems streamLaundryItems)
    : _streamLaundryItems = streamLaundryItems;

  @override
  List<FieldSelector<LaundryItemEntity>> get searchFields => [(c) => c.name];

  /// Mendengarkan perubahan data laundry item secara realtime
  void listenLaundryItems() {
    listen(() => _streamLaundryItems());
  }
}
