import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

class OrderFormState {
  final CustomerEntity? customer;
  final List<OrderGroupEntity> groups;
  final String notes;

  const OrderFormState({
    this.customer,
    this.groups = const [],
    this.notes = '',
  });

  OrderFormState copyWith({
    CustomerEntity? customer,
    List<OrderGroupEntity>? groups,
    String? notes,
  }) {
    return OrderFormState(
      customer: customer ?? this.customer,
      groups: groups ?? this.groups,
      notes: notes ?? this.notes,
    );
  }

  bool get hasCustomer => customer != null;

  bool get hasGroups => groups.isNotEmpty;

  bool get canSubmit => hasCustomer && hasGroups;

  List<Object?> get props => [customer, groups, notes];
}
