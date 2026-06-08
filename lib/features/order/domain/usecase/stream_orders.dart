// =============================================================================
// File        : stream_customers.dart
// Path        : lib/features/customer/domain/usecase/stream_customers.dart
// Layer       : Domain (Use Case)
// -----------------------------------------------------------------------------
// Fungsi:
// - Mendengarkan perubahan data customer secara realtime
// - Mengambil `companyId` dari session aktif
// - Menghubungkan Domain Layer dengan CustomerRepository
// - Mengembalikan stream daftar customer
// - Menangani error autentikasi menjadi Failure stream
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/repositories/order_repository.dart';

class StreamOrders {
  final OrderRepository _repository;
  final SessionService _session;

  StreamOrders({
    required OrderRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  /// Mendengarkan perubahan data customer secara realtime
  Stream<Either<Failure, List<OrderEntity>>> call() {
    try {
      final companyId = _session.companyId;

      return _repository.streamAll(companyId);
    } on UnauthorizedException catch (e) {
      return Stream.value(Left(e.failure));
    }
  }
}
