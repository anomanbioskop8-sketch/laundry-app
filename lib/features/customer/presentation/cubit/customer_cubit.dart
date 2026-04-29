import 'package:app_laundry/core/base/cubit/base_search_cubit.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/stream_customers.dart';

class CustomerCubit extends BaseSearchCubit<CustomerEntity> {
  final StreamCustomers streamCustomers;

  CustomerCubit(this.streamCustomers);

  @override
  List<FieldSelector<CustomerEntity>> get searchFields => [
    (c) => c.name,
    (c) => c.phone,
  ];

  void listenCustomers() {
    listen(() => streamCustomers());
  }
}
