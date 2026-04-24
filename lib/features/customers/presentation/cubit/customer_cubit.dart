// =============================================================================
// File        : customer_cubit.dart
// Path        : features/customers/presentation/cubit/customer_cubit.dart
// Layer       : Presentation (State Management - SaaS V3)
// -----------------------------------------------------------------------------
// CustomerCubit
//
// Responsibility:
// - Menyediakan stream data customer dari domain layer
// - Menjadi bridge antara UseCase → UI Engine (BaseListPage)
// - Tidak ada filter, sort, atau logic UI
//
// Notes:
// - Semua logic search/filter dipindahkan ke BaseCrudEngine
// - Cubit hanya handle data source (STREAM ONLY)
// =============================================================================

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/customer_entity.dart';
import '../../domain/usecases/params/customer_params.dart';
import '../../domain/usecases/stream_customers_usecase.dart';

class CustomerCubit extends Cubit<void> {
  final StreamCustomersUseCase streamUseCase;

  CustomerCubit(this.streamUseCase) : super(null);

  /// =========================================================
  /// STREAM PROVIDER (SAAS V3 PURE DATA SOURCE)
  /// =========================================================
  ///
  /// Tidak menyimpan state.
  /// Hanya mengembalikan stream ke BaseListPage engine.
  ///
  Stream<List<CustomerEntity>> start(String companyId) {
    return streamUseCase(StreamCustomerParams(companyId));
  }
}
