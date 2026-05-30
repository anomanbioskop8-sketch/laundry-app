// =============================================================================
// File        : create_customer.dart
// Path        : lib/features/customer/domain/usecase/create_customer.dart
// Layer       : Domain (Use Case)
// -----------------------------------------------------------------------------
// Fungsi:
// - Membuat data customer baru
// - Menghasilkan ID customer secara otomatis menggunakan UUID
// - Mengambil `companyId` dari session aktif
// - Membentuk entity customer sebelum dikirim ke repository
// - Menangani error autentikasi menjadi Failure
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';
import 'package:app_laundry/features/customer/domain/usecase/params/create_customer_params.dart';
import 'package:uuid/uuid.dart';

class CreateCustomer {
  final CustomerRepository _repository;
  final SessionService _session;

  CreateCustomer({
    required CustomerRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  /// Membuat customer baru
  Future<Either<Failure, void>> call(CreateCustomerParams params) async {
    try {
      final companyId = _session.companyId;

      final id = const Uuid().v4();

      final customer = CustomerEntity(
        id: id,
        name: params.name,
        phone: params.phone,
        address: params.address,
      );

      return await _repository.create(companyId: companyId, customer: customer);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
