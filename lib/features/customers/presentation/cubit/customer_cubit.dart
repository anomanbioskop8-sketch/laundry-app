import 'package:app_laundry/core/base/cubit/base_cubit.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/customers/domain/usecases/params/customer_params.dart';
import 'package:app_laundry/features/customers/domain/usecases/stream_customers_usecase.dart';

class CustomerCubit extends BaseCubit<List<CustomerEntity>> {
  final StreamCustomersUseCase streamUseCase;

  CustomerCubit(this.streamUseCase);

  void listen(String companyId) {
    executeStream(
      stream: () => streamUseCase(StreamCustomerParams(companyId)),
      isList: true,
    );
  }
}
