// =============================================================================
// File        : delete_customer.dart
// Path        : lib/features/customer/domain/usecase/delete_customer.dart
// Layer       : Domain (Use Case)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menghapus data customer berdasarkan ID
// - Mengambil `companyId` dari session aktif
// - Menjalankan proses hapus melalui CustomerRepository
// - Menangani error autentikasi menjadi Failure
// =============================================================================

import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/customer/domain/repositories/customer_repository.dart';

class DeleteCustomer {
  final CustomerRepository _repository;
  final SessionService _session;

  DeleteCustomer({
    required CustomerRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  /// Menghapus customer berdasarkan ID
  Future<Either<Failure, void>> call(String id) async {
    try {
      final companyId = _session.companyId;

      return _repository.deleteById(companyId: companyId, id: id);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
