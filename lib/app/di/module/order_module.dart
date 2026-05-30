// =============================================================================
// File        : customer_module.dart
// Path        : lib/app/di/module/customer_module.dart
// Layer       : App (Dependency Injection)
// -----------------------------------------------------------------------------
// Fungsi:
// - Register dependency untuk fitur Customer
// =============================================================================

import 'package:app_laundry/features/laundry_item/domain/usecases/stream_laundry_items.dart';
import 'package:app_laundry/features/laundry_price/domain/usecases/get_laundry_price.dart';
import 'package:app_laundry/features/order/data/datasources/order_remote_data_source.dart';
import 'package:app_laundry/features/order/data/repositories/order_repository_impl.dart';
import 'package:app_laundry/features/order/domain/repositories/order_repository.dart';
import 'package:app_laundry/features/order/domain/usecase/change_order_status.dart';
import 'package:app_laundry/features/order/domain/usecase/create_order.dart';
import 'package:app_laundry/features/order/domain/usecase/delete_order.dart';
import 'package:app_laundry/features/order/domain/usecase/pay_order.dart';
import 'package:app_laundry/features/order/domain/usecase/stream_order_laundry_items.dart';
import 'package:app_laundry/features/order/domain/usecase/stream_orders.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_action_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_cubit.dart';
import 'package:app_laundry/features/order/presentation/cubit/order_laundry_item_cubit.dart';
import 'package:get_it/get_it.dart';

class OrderModule {
  final GetIt sl;

  OrderModule(this.sl);

  Future<void> init() async {
    _dataSources();
    _repositories();
    _useCases();
    _cubits();
  }

  // =========================
  // DATA SOURCE
  // =========================
  void _dataSources() {
    sl.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSource(
        sl(), // logger
        firestore: sl(), // FirebaseFirestore
      ),
    );
  }

  // =========================
  // REPOSITORY
  // =========================
  void _repositories() {
    sl.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(sl<OrderRemoteDataSource>()),
    );
  }

  // =========================
  // USE CASE
  // =========================
  void _useCases() {
    sl.registerLazySingleton<StreamOrders>(
      () => StreamOrders(
        repository: sl<OrderRepository>(),
        session: sl(), // SessionCubit
      ),
    );

    sl.registerLazySingleton<StreamOrderLaundryItems>(
      () => StreamOrderLaundryItems(
        streamLaundryItems: sl<StreamLaundryItems>(),
        getLaundryPrice: sl<GetLaundryPrice>(), // SessionCubit
      ),
    );

    sl.registerLazySingleton<CreateOrder>(
      () => CreateOrder(
        repository: sl<OrderRepository>(),
        session: sl(), // ⚠️ butuh session aktif
      ),
    );

    sl.registerLazySingleton<ChangeOrderStatus>(
      () => ChangeOrderStatus(
        repository: sl<OrderRepository>(),
        session: sl(), // ⚠️ butuh session aktif
      ),
    );

    sl.registerLazySingleton<PayOrder>(
      () => PayOrder(
        repository: sl<OrderRepository>(),
        session: sl(), // ⚠️ guard akses
      ),
    );

    sl.registerLazySingleton<DeleteOrder>(
      () => DeleteOrder(
        repository: sl<OrderRepository>(),
        session: sl(), // ⚠️ guard akses
      ),
    );
  }

  // =========================
  // CUBIT (UI LAYER)
  // =========================
  void _cubits() {
    /// CustomerCubit → stream data (list)
    sl.registerFactory<OrderCubit>(() => OrderCubit(sl<StreamOrders>()));

    /// CustomerActionCubit → create / update / delete
    sl.registerFactory<OrderActionCubit>(
      () => OrderActionCubit(
        create: sl<CreateOrder>(),
        changeStatus: sl<ChangeOrderStatus>(),
        pay: sl<PayOrder>(),
        delete: sl<DeleteOrder>(),
      ),
    );

    sl.registerFactory<OrderLaundryItemCubit>(
      () => OrderLaundryItemCubit(sl<StreamOrderLaundryItems>()),
    );
  }
}
