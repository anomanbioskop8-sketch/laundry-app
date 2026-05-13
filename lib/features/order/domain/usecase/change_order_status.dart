// =============================================================================
// File        : change_order_status.dart
// Path        : lib/features/order/domain/usecases/change_order_status.dart
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';

import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';

import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/order/domain/entities/order_entity.dart';

import 'package:app_laundry/features/order/domain/enums/order_status_ext.dart';

import 'package:app_laundry/features/order/domain/repositories/order_repository.dart';

class ChangeOrderStatus {
  final OrderRepository _repository;
  final SessionService _session;

  const ChangeOrderStatus({
    required OrderRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, OrderEntity>> call(OrderEntity order) async {
    try {
      final companyId = _session.companyId;

      /// =========================
      /// VALIDATE NEXT STATUS
      /// =========================

      final nextStatus = order.orderStatus.next;

      if (nextStatus == null) {
        return const Left(ValidationFailure('Status order tidak dapat diubah'));
      }

      /// =========================
      /// UPDATE ENTITY
      /// =========================

      final updatedOrder = order.copyWith(
        orderStatus: nextStatus,
        updatedAt: DateTime.now(),
      );

      /// =========================
      /// SAVE
      /// =========================

      final result = await _repository.update(
        companyId: companyId,
        order: updatedOrder,
      );

      if (result.isLeft) {
        return Left(result.left!);
      }

      return Right(updatedOrder);
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    }
  }
}
