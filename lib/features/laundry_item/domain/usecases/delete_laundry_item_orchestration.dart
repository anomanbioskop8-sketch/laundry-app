import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/delete_laundry_item.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/delete_laundry_price_by_item_id.dart';

class DeleteLaundryItemOrchestration {
  final DeleteLaundryItem _deleteLaundryItem;
  final DeleteLaundryPriceByItemId _deleteLaundryPrices;

  DeleteLaundryItemOrchestration({
    required DeleteLaundryItem deleteLaundryItem,
    required DeleteLaundryPriceByItemId deleteLaundryPrices,
  }) : _deleteLaundryItem = deleteLaundryItem,
       _deleteLaundryPrices = deleteLaundryPrices;

  Future<Either<Failure, void>> call(String id) async {
    /// =========================
    /// DELETE PRICES
    /// =========================

    final deletePricesResult = await _deleteLaundryPrices(id);

    if (deletePricesResult.isLeft) {
      return deletePricesResult;
    }

    /// =========================
    /// DELETE ITEM
    /// =========================

    return await _deleteLaundryItem(id);
  }
}
