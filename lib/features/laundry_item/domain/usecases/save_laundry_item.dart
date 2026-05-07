import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/create_laundry_item.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/update_laundry_item.dart';

class SaveLaundryItem {
  final CreateLaundryItem _createLaundryItem;
  final UpdateLaundryItem _updateLaundryItem;

  SaveLaundryItem({
    required CreateLaundryItem createLaundryItem,
    required UpdateLaundryItem updateLaundryItem,
  }) : _createLaundryItem = createLaundryItem,
       _updateLaundryItem = updateLaundryItem;

  Future<Either<Failure, void>> call(SaveLaundryItemParams params) async {
    if (!params.isValid) {
      return Left(AuthFailure('Data tidak valid'));
    }

    /// =========================
    /// UPDATE
    /// =========================
    if (params.isEdit) {
      return _updateLaundryItem(
        UpdateLaundryItemParams(
          id: params.id!,
          name: params.name,
          category: params.category,
        ),
      );
    }

    /// =========================
    /// CREATE
    /// =========================
    return _createLaundryItem(
      CreateLaundryItemParams(name: params.name, category: params.category),
    );
  }
}
