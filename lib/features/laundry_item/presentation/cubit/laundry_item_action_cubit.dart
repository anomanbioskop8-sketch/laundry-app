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

import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/core/constants/strings/laundry_item_strings.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/delete_laundry_item_orchestration.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/params/save_laundry_item_params.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/save_laundry_item.dart';

class LaundryItemActionCubit extends BaseActionCubit<void> {
  final SaveLaundryItem _save;
  final DeleteLaundryItemOrchestration _delete;

  LaundryItemActionCubit({
    required SaveLaundryItem save,
    required DeleteLaundryItemOrchestration delete,
  }) : _save = save,
       _delete = delete;

  /// Menyimpan atau memperbarui data laundry item
  Future<void> submit(SaveLaundryItemParams params) async {
    await execute(
      call: () => _save(params),
      successMessage: LaundryItemStrings.saveSuccess,
    );
  }

  /// Menghapus data laundry item
  Future<void> delete(String id) async {
    await execute(
      call: () => _delete(id),
      successMessage: LaundryItemStrings.deleteSuccess,
    );
  }
}
