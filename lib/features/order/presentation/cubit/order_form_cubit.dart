import 'package:app_laundry/features/order/domain/enums/payment_status.dart';
import 'package:app_laundry/features/order/domain/usecase/build_create_order_params.dart';
import 'package:app_laundry/features/order/domain/usecase/params/create_order_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'order_form_state.dart';

class OrderFormCubit extends Cubit<OrderFormState> {
  final BuildCreateOrderParams _buildCreateOrderParams;

  OrderFormCubit(this._buildCreateOrderParams) : super(const OrderFormState());

  // =========================
  // CUSTOMER
  // =========================

  void setCustomer(CustomerEntity customer) {
    emit(state.copyWith(customer: customer));
  }

  void clearCustomer() {
    emit(state.copyWith(customer: null));
  }

  // =========================
  // GROUPS
  // =========================

  void addGroup(OrderGroupEntity group) {
    emit(state.copyWith(groups: [...state.groups, group]));
  }

  void removeGroup(OrderGroupEntity group) {
    emit(
      state.copyWith(groups: state.groups.where((e) => e != group).toList()),
    );
  }

  void updateGroup(int index, OrderGroupEntity group) {
    final groups = [...state.groups];

    groups[index] = group;

    emit(state.copyWith(groups: groups));
  }

  void setGroups(List<OrderGroupEntity> groups) {
    emit(state.copyWith(groups: groups));
  }

  void clearGroups() {
    emit(state.copyWith(groups: []));
  }

  // =========================
  // NOTES
  // =========================

  void setNotes(String notes) {
    emit(state.copyWith(notes: notes));
  }

  // =========================
  // RESET
  // =========================

  void reset() {
    emit(const OrderFormState());
  }

  CreateOrderParams buildParams({required PaymentStatus paymentStatus}) {
    return _buildCreateOrderParams(
      customer: state.customer,
      groups: state.groups,
      paymentStatus: paymentStatus,
    );
  }
}
