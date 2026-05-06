import 'package:app_laundry/core/network/base_crud_remote_datasource.dart';
import 'package:app_laundry/features/laundry_item/data/models/laundry_item_model.dart';

class LaundryItemRemoteDataSource
    extends BaseCrudRemoteDataSource<LaundryItemModel> {
  LaundryItemRemoteDataSource(super.logger, {required super.firestore});

  @override
  String get collection => 'laundry_items';

  @override
  LaundryItemModel fromMap(Map<String, dynamic> map, String id) {
    return LaundryItemModel.fromMap(map, id);
  }

  @override
  Map<String, dynamic> toMap(LaundryItemModel data) {
    return data.toMap();
  }
}
