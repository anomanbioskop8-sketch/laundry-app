import 'dart:async';

import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/auth/session/cubit/session_state.dart';
import 'package:app_laundry/core/base/stream/base_search_cubit.dart';
import 'package:app_laundry/core/base/stream/base_stream_state.dart';
import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

class CompanyCubit extends BaseSearchCubit<CompanyEntity> {
  final SessionCubit _session;

  StreamSubscription<SessionState>? _subscription;

  CompanyCubit(SessionCubit session) : _session = session {
    _syncState();

    _listenSession();
  }

  // =========================
  // SEARCH
  // =========================

  @override
  List<FieldSelector<CompanyEntity>> get searchFields => [(c) => c.name];

  // =========================
  // INITIAL SYNC
  // =========================

  void _syncState() {
    if (_session.isLoading) {
      emit(const BaseStreamState.loading());

      return;
    }

    if (!_session.isActive) {
      emit(const BaseStreamState.empty());

      return;
    }

    _emitCompany(_session.session.company);
  }

  // =========================
  // SESSION LISTENER
  // =========================

  void _listenSession() {
    _subscription = _session.stream.listen((_) {
      _syncState();
    });
  }

  // =========================
  // EMIT COMPANY
  // =========================

  void _emitCompany(CompanyEntity? company) {
    if (company == null) {
      emit(const BaseStreamState.empty());

      return;
    }

    emit(BaseStreamState.loaded([company]));
  }

  // =========================
  // GETTER
  // =========================

  CompanyEntity? get company {
    return state.maybeWhen(
      loaded: (data) => data.isNotEmpty ? data.first : null,
      orElse: () => null,
    );
  }

  // =========================
  // DISPOSE
  // =========================

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }
}
