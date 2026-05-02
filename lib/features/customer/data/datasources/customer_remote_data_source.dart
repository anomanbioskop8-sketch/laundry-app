import 'package:app_laundry/core/network/base_crud_remote_datasource.dart';
import 'package:app_laundry/features/customer/data/models/customer_model.dart';

class CustomerRemoteDataSource extends BaseCrudRemoteDataSource<CustomerModel> {
  CustomerRemoteDataSource(super.logger, {required super.firestore});

  @override
  String get collection => 'customers';

  @override
  CustomerModel fromMap(Map<String, dynamic> map, String id) {
    return CustomerModel.fromMap(map, id);
  }

  @override
  Map<String, dynamic> toMap(CustomerModel data) {
    return data.toMap();
  }
}
