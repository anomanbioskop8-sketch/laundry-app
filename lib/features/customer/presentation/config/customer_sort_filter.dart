import 'package:app_laundry/core/base/models/sort_filter_config.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

/// =========================
/// SORT OPTIONS
/// =========================
class CustomerSortFilter {
  static List<SortOption<CustomerEntity>> get sorts => [
    SortOption(
      label: 'Nama A-Z',
      selector: (c) => (c.name ?? '').toLowerCase(),
    ),
    SortOption(
      label: 'Nama Z-A',
      selector: (c) => (c.name ?? '').toLowerCase(),
      ascending: false,
    ),
    // SortOption(
    //   label: 'Terbaru',
    //   selector: (c) => c.createdAt ?? DateTime(0),
    //   ascending: false,
    // ),
    // SortOption(label: 'Terlama', selector: (c) => c.createdAt ?? DateTime(0)),
  ];

  /// =========================
  /// FILTER OPTIONS
  /// =========================
  static List<FilterOption<CustomerEntity>> get filters => [
    FilterOption(label: 'Semua', predicate: (_) => true),

    // 🔥 contoh kalau nanti ada field tambahan
    // FilterOption(
    //   label: 'Punya Telepon',
    //   predicate: (c) => (c.phone ?? '').isNotEmpty,
    // ),

    // FilterOption(
    //   label: 'Tanpa Telepon',
    //   predicate: (c) => (c.phone ?? '').isEmpty,
    // ),
  ];
}
