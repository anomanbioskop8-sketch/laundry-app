// =============================================================================
// File        : customer_action_cubit.dart
// Path        : lib/features/customer/presentation/cubit/customer_action_cubit.dart
// Layer       : Presentation (Cubit)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengelola aksi customer seperti simpan dan hapus data
// - Menjalankan use case `SaveCustomer` dan `DeleteCustomer`
// - Menangani loading, success, dan error state melalui BaseActionCubit
// - Menyediakan pesan sukses setelah aksi berhasil dijalankan
// =============================================================================

import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/core/constants/strings/customer_strings.dart';
import 'package:app_laundry/features/customer/domain/usecase/delete_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/params/save_customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/save_customer.dart';

class CustomerActionCubit extends BaseActionCubit<void> {
  final SaveCustomer _save;
  final DeleteCustomer _delete;

  CustomerActionCubit({
    required SaveCustomer save,
    required DeleteCustomer delete,
  }) : _save = save,
       _delete = delete;

  /// Menyimpan atau memperbarui data customer
  Future<void> submit(SaveCustomerParams params) async {
    await execute(
      call: () => _save(params),
      successMessage: CustomerStrings.saveSuccess,
    );
  }

  /// Menghapus data customer
  Future<void> deleteCustomer(String id) {
    return execute(
      call: () => _delete(id),
      successMessage: CustomerStrings.deleteSuccess,
    );
  }
}
