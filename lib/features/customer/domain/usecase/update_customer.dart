// =============================================================================
// File        : update_customer.dart
// Path        : lib/features/customer/domain/usecase/update_customer.dart
// Layer       : Domain (Use Case)
// -----------------------------------------------------------------------------
// Fungsi:
// - Memperbarui data customer yang sudah ada
// - Mengambil `companyId` dari session aktif
// - Membentuk entity customer dari parameter update
// - Menjalankan proses update melalui CustomerRepository
// - Menangani error autentikasi menjadi Failure
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/params/update_customer_params.dart';

class UpdateCustomer {
  final CustomerRepository _repository;
  final SessionService _session;

  UpdateCustomer({
    required CustomerRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  /// Memperbarui data customer
  Future<Either<Failure, void>> call(UpdateCustomerParams params) async {
    try {
      final companyId = _session.companyId;

      final customer = CustomerEntity(
        id: params.id,
        name: params.name,
        phone: params.phone,
        address: params.address,
      );

      return await _repository.update(companyId: companyId, customer: customer);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
