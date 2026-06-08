import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_order_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_service_type.dart';
import 'package:app_laundry/features/laundry/domain/enums/laundry_speed_type.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/order/domain/entities/order_laundry_item_entity.dart';
import 'package:app_laundry/features/order/domain/usecase/build_order_group.dart';
import 'package:app_laundry/features/setting/domain/usecases/get_setting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_group_form_state.dart';

class OrderGroupFormCubit extends Cubit<OrderGroupFormState> {
  final BuildOrderGroup _buildOrderGroup;
  final GetSetting _getSetting;

  OrderGroupFormCubit({
    required BuildOrderGroup buildOrderGroup,
    required GetSetting getSetting,
  }) : _buildOrderGroup = buildOrderGroup,
       _getSetting = getSetting,
       super(
         const OrderGroupFormState(
           serviceType: LaundryServiceType.wash,
           speedType: LaundrySpeedType.regular,
           orderType: LaundryOrderType.pcs,
         ),
       );

  // =========================
  // ITEMS
  // =========================

  void setItems(List<OrderLaundryItemEntity> items) {
    emit(state.copyWith(items: items));
  }

  void addItems(List<OrderLaundryItemEntity> newItems) {
    final items = [...state.items];

    for (final item in newItems) {
      final index = items.indexWhere((e) => e.itemId == item.itemId);

      if (index >= 0) {
        items[index] = item;
      } else {
        items.add(item);
      }
    }

    emit(state.copyWith(items: items));
  }

  void removeItem(String itemId) {
    emit(
      state.copyWith(
        items: state.items.where((e) => e.itemId != itemId).toList(),
      ),
    );
  }

  void clearItems() {
    emit(state.copyWith(items: []));
  }

  // =========================
  // BUILD
  // =========================

  Future<OrderGroupEntity> build({
    required LaundryServiceType serviceType,
    required LaundrySpeedType speedType,
    required LaundryOrderType orderType,
    required double weight,
  }) async {
    final result = await _getSetting();

    return result.fold(
      (failure) => throw ValidationException(failure.message),
      (setting) {
        if (setting == null) {
          throw NotFoundException('Setting tidak ditemukan');
        }

        final price = speedType == LaundrySpeedType.regular
            ? setting.regularPrice
            : setting.expressPrice;

        return _buildOrderGroup(
          serviceType: serviceType,
          speedType: speedType,
          orderType: orderType,
          items: state.items,
          weight: weight,
          price: price,
        );
      },
    );
  }
}
