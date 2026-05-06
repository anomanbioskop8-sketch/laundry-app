import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/create_laundry_item.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/laundry_item_params.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/update_laundry_item.dart';

class SaveLaundryItem {
  final CreateLaundryItem createLaundryItem;
  final UpdateLaundryItem updateLaundryItem;

  SaveLaundryItem({
    required this.createLaundryItem,
    required this.updateLaundryItem,
  });

  Future<Either<Failure, void>> call(SaveLaundryItemParams params) async {
    if (!params.isValid) {
      return Left(AuthFailure('Data tidak valid'));
    }

    /// =========================
    /// UPDATE
    /// =========================
    if (params.isEdit) {
      return updateLaundryItem(
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
    return createLaundryItem(
      CreateLaundryItemParams(name: params.name, category: params.category),
    );
  }
}
