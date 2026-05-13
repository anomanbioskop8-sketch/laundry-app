import 'package:app_laundry/core/network/base_crud_remote_datasource.dart';
import 'package:app_laundry/features/order/data/models/order_model.dart';

class OrderRemoteDataSource extends BaseCrudRemoteDataSource<OrderModel> {
  OrderRemoteDataSource(super.logger, {required super.firestore});

  @override
  String get collection => 'orders';

  @override
  OrderModel fromMap(Map<String, dynamic> map, String id) {
    return OrderModel.fromMap(map, id);
  }

  @override
  Map<String, dynamic> toMap(OrderModel data) {
    return data.toMap();
  }
}
