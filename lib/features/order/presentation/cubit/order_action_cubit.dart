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
import 'package:app_laundry/core/constants/strings/order_strings.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status_ext.dart';
import 'package:app_laundry/features/order/domain/usecase/change_order_status.dart';
import 'package:app_laundry/features/order/domain/usecase/create_order.dart';
import 'package:app_laundry/features/order/domain/usecase/delete_order.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:app_laundry/features/order/domain/usecase/params/pay_order_params.dart';
import 'package:app_laundry/features/order/domain/usecase/pay_order.dart';

class OrderActionCubit extends BaseActionCubit<void> {
  final CreateOrder _create;
  final ChangeOrderStatus _changeStatus;
  final PayOrder _pay;
  final DeleteOrder _delete;

  OrderActionCubit({
    required CreateOrder create,
    required ChangeOrderStatus changeStatus,
    required PayOrder pay,
    required DeleteOrder delete,
  }) : _create = create,
       _changeStatus = changeStatus,
       _pay = pay,
       _delete = delete;

  /// Menyimpan atau memperbarui data laundry item
  Future<void> create(CreateOrderParams params) async {
    await execute(
      call: () => _create(params),
      successMessage: OrderStrings.createSuccess,
    );
  }

  Future<void> changeStatus(OrderEntity order) async {
    await execute(
      call: () => _changeStatus(order),
      successMessage: order.orderStatus.successMessage,
    );
  }

  Future<void> pay(PayOrderParams params) async {
    await execute(
      call: () => _pay(params),
      successMessage: OrderStrings.paySuccess,
    );
  }

  /// Menghapus data laundry item
  Future<void> delete(String id) async {
    await execute(
      call: () => _delete(id),
      successMessage: OrderStrings.deleteSuccess,
    );
  }
}
