import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/create_laundry_item_orchestration.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/params/create_laundry_item_params.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/params/save_laundry_item_params.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/params/update_laundry_item_params.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/update_laundry_item.dart';

class SaveLaundryItem {
  final CreateLaundryItemOrchestration _create;
  final UpdateLaundryItem _update;

  SaveLaundryItem({
    required CreateLaundryItemOrchestration create,
    required UpdateLaundryItem update,
  }) : _create = create,
       _update = update;

  Future<Either<Failure, void>> call(SaveLaundryItemParams params) async {
    if (!params.isValid) {
      return Left(AuthFailure('Data tidak valid'));
    }

    /// =========================
    /// UPDATE
    /// =========================
    if (params.isEdit) {
      return _update(
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
    return _create(
      CreateLaundryItemParams(name: params.name, category: params.category),
    );
  }
}
