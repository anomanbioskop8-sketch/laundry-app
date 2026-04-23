import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';

class CreateCustomerParams {
  final CustomerEntity customer;

  CreateCustomerParams(this.customer);
}

class UpdateCustomerParams {
  final CustomerEntity customer;

  UpdateCustomerParams(this.customer);
}

class DeleteCustomerParams {
  final String id;

  DeleteCustomerParams(this.id);
}

class StreamCustomerParams {
  final String companyId;

  StreamCustomerParams(this.companyId);
}
