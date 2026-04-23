import 'package:app_laundry/core/base/cubit/base_search_cubit.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';
import 'package:app_laundry/features/customers/domain/usecases/stream_customers_usecase.dart';

class CustomerCubit extends BaseSearchCubit<CustomerEntity> {
  final StreamCustomersUseCase streamUseCase;

  CustomerCubit(this.streamUseCase);

  void listen(String companyId) {
    executeSearchStream(
      stream: () => streamUseCase(StreamCustomerParams(companyId)),
    );
  }

  @override
  bool filter(CustomerEntity item, String keyword) {
    return item.name.toLowerCase().contains(keyword.toLowerCase()) ||
        item.phone.toLowerCase().contains(keyword.toLowerCase());
  }

  @override
  List<CustomerEntity> sort(List<CustomerEntity> data) {
    data.sort((a, b) => a.name.compareTo(b.name));
    return data;
  }
}
