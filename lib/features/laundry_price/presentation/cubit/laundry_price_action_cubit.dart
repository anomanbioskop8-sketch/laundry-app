// =============================================================================
// File        : laundry_item_action_cubit.dart
// Path        : lib/features/laundry_item/presentation/cubit/laundry_item_action_cubit.dart
// Layer       : Presentation (Cubit)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mengelola aksi data laundry item seperti simpan dan hapus
// - Menjalankan use case `SaveLaundryItem` dan `DeleteLaundryItem`
// - Menangani loading, success, dan error state melalui BaseActionCubit
// - Menampilkan pesan sukses setelah aksi berhasil dijalankan
// =============================================================================

import 'package:app_laundry/core/base/action/base_action_cubit.dart';
import 'package:app_laundry/core/constants/strings/laundry_price_strings.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/delete_laundry_price.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/params/save_laundry_price_params.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/update_laundry_price.dart';

class LaundryPriceActionCubit extends BaseActionCubit<void> {
  final UpdateLaundryPrice _update;
  final DeleteLaundryPrice _delete;

  LaundryPriceActionCubit({
    required UpdateLaundryPrice update,
    required DeleteLaundryPrice delete,
  }) : _update = update,
       _delete = delete;

  /// Menyimpan atau memperbarui data laundry item
  Future<void> submit(SaveLaundryPriceParams params) async {
    await execute(
      call: () => _update(params),
      successMessage: LaundryPriceStrings.saveSuccess,
    );
  }

  /// Menghapus data laundry item
  Future<void> delete(String id) async {
    await execute(
      call: () => _delete(id),
      successMessage: LaundryPriceStrings.deleteSuccess,
    );
  }
}
