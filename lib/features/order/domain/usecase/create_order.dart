// =============================================================================
// File        : create_order.dart
// Path        : lib/features/order/domain/usecases/create_order.dart
// Layer       : Domain
// =============================================================================

import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/utils/invoice_generator.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/order_status.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group_entity_ext.dart';
import 'package:app_laundry/features/order/domain/repositories/order_repository.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:uuid/uuid.dart';

class CreateOrder {
  final OrderRepository _repository;
  final SessionService _session;

  const CreateOrder({
    required OrderRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, OrderEntity>> call(CreateOrderParams params) async {
    try {
      final companyId = _session.companyId;

      /// =========================
      /// CREATE ENTITY
      /// =========================

      final order = OrderEntity(
        id: const Uuid().v4(),
        invoiceNumber: InvoiceGenerator.generate(),
        customerId: params.customer.id,
        groups: params.groups,
        orderStatus: OrderStatus.received,
        paymentStatus: params.paymentStatus,
        total: params.groups.subtotal,
      );

      /// =========================
      /// SAVE
      /// =========================

      final result = await _repository.create(
        companyId: companyId,
        order: order,
      );

      if (result.isLeft) {
        return Left(result.left!);
      }

      return Right(order);
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    }
  }
}
