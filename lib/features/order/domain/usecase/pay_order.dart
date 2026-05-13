import 'package:app_laundry/core/auth/session/domain/services/session_service.dart';
import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/repositories/order_repository.dart';
import 'package:app_laundry/features/order/domain/usecase/order_params.dart';

class PayOrder {
  final OrderRepository _repository;
  final SessionService _session;

  const PayOrder({
    required OrderRepository repository,
    required SessionService session,
  }) : _repository = repository,
       _session = session;

  Future<Either<Failure, OrderEntity>> call(PayOrderParams params) async {
    try {
      final companyId = _session.companyId;

      final updatedOrder = params.order.copyWith(
        paymentStatus: PaymentStatus.paid,
      );

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
