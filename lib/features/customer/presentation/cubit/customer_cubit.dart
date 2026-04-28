import 'package:app_laundry/core/base/cubit/base_stream_cubit.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customer/domain/usecase/stream_customers.dart';

class CustomerCubit extends BaseStreamCubit<CustomerEntity> {
  final StreamCustomers streamCustomers;

  CustomerCubit(this.streamCustomers);

  void listenCustomers() {
    listen(() => streamCustomers());
  }
}
