import '../cubit/session_cubit.dart';

extension SessionX on SessionCubit {
  String? get maybeCompanyId {
    try {
      return companyId;
    } catch (_) {
      return null;
    }
  }
}
