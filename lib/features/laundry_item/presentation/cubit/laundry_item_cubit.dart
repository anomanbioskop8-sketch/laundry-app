import 'package:app_laundry/core/base/cubit/base_search_cubit.dart';
import 'package:app_laundry/features/laundry_item/domain/entities/laundry_item_entity.dart';
import 'package:app_laundry/features/laundry_item/domain/usecases/stream_laundry_items.dart';

class LaundryItemCubit extends BaseSearchCubit<LaundryItemEntity> {
  final StreamLaundryItems streamLaundryItems;

  LaundryItemCubit(this.streamLaundryItems);

  @override
  List<FieldSelector<LaundryItemEntity>> get searchFields => [(c) => c.name];

  void listenLaundryItems() {
    listen(() => streamLaundryItems());
  }
}
