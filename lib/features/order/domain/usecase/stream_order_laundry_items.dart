import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';

import 'package:app_laundry/features/laundry_item/domain/usecases/stream_laundry_items.dart';

import 'package:app_laundry/features/laundry_price/domain/usecases/get_laundry_price.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/params/get_laundry_price_params.dart';

import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/params/stream_order_laundry_items_params.dart';

class StreamOrderLaundryItems {
  final StreamLaundryItems _streamLaundryItems;
  final GetLaundryPrice _getLaundryPrice;

  const StreamOrderLaundryItems({
    required StreamLaundryItems streamLaundryItems,
    required GetLaundryPrice getLaundryPrice,
  }) : _streamLaundryItems = streamLaundryItems,
       _getLaundryPrice = getLaundryPrice;

  Stream<Either<Failure, List<OrderLaundryItemEntity>>> call(
    StreamOrderLaundryItemsParams params,
  ) async* {
    await for (final result in _streamLaundryItems()) {
      if (result.isLeft) {
        yield Left(result.left!);
        continue;
      }

      final items = result.right;

      final orderItems = <OrderLaundryItemEntity>[];

      for (final item in items!) {
        final priceResult = await _getLaundryPrice(
          GetLaundryPriceParams(
            itemId: item.id,
            serviceType: params.serviceType,
            speedType: params.speedType,
          ),
        );

        if (priceResult.isLeft) {
          yield Left(priceResult.left!);
          return;
        }

        final price = priceResult.right;

        orderItems.add(
          OrderLaundryItemEntity(
            itemId: item.id,
            itemName: item.name,
            price: price?.price ?? 0,
            qty: 0,
          ),
        );
      }

      yield Right(orderItems);
    }
  }
}
