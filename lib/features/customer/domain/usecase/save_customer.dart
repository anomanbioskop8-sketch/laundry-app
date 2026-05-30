// =============================================================================
// File        : save_customer.dart
// Path        : lib/features/customer/domain/usecase/save_customer.dart
// Layer       : Domain (Use Case)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menentukan proses create atau update customer
// - Melakukan validasi data sebelum disimpan
// - Menjalankan use case `CreateCustomer` untuk data baru
// - Menjalankan use case `UpdateCustomer` untuk edit data
// - Menjadi entry point utama proses penyimpanan customer
// =============================================================================

import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/features/customer/domain/usecase/create_customer.dart';
import 'package:app_laundry/features/customer/domain/usecase/params/create_customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/params/save_customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/params/update_customer_params.dart';
import 'package:app_laundry/features/customer/domain/usecase/update_customer.dart';

class SaveCustomer {
  final CreateCustomer _createCustomer;
  final UpdateCustomer _updateCustomer;

  SaveCustomer({
    required CreateCustomer createCustomer,
    required UpdateCustomer updateCustomer,
  }) : _createCustomer = createCustomer,
       _updateCustomer = updateCustomer;

  /// Menyimpan data customer baru atau memperbarui data existing
  Future<Either<Failure, void>> call(SaveCustomerParams params) async {
    try {
      if (!params.isValid) {
        return Left(AuthFailure('Data tidak valid'));
      }

      /// =========================
      /// UPDATE
      /// =========================
      if (params.isEdit) {
        return _updateCustomer(
          UpdateCustomerParams(
            id: params.id!,
            name: params.name,
            phone: params.phone,
            address: params.address,
          ),
        );
      }

      /// =========================
      /// CREATE
      /// =========================
      return _createCustomer(
        CreateCustomerParams(
          name: params.name,
          phone: params.phone,
          address: params.address,
        ),
      );
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
