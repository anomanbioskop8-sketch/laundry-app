import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/create_laundry_item.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/create_default_price_item.dart';

class CreateLaundryItemOrchestration {
  final CreateLaundryItem _createLaundryItem;
  final CreateDefaultLaundryPrices _createDefaultLaundryPrices;

  const CreateLaundryItemOrchestration({
    required CreateLaundryItem createLaundryItem,
    required CreateDefaultLaundryPrices createDefaultLaundryPrices,
  }) : _createLaundryItem = createLaundryItem,
       _createDefaultLaundryPrices = createDefaultLaundryPrices;

  Future<Either<Failure, void>> call(CreateLaundryItemParams params) async {
    /// =========================
    /// CREATE ITEM
    /// =========================

    final createItemResult = await _createLaundryItem(params);

    if (createItemResult.isFailure) {
      return Left(createItemResult.left!);
    }

    final item = createItemResult.right!;

    /// =========================
    /// CREATE DEFAULT PRICES
    /// =========================

    final defaultPricesResult = await _createDefaultLaundryPrices(item.id);

    if (defaultPricesResult.isFailure) {
      return Left(defaultPricesResult.left!);
    }

    return const Right(null);
  }
}
