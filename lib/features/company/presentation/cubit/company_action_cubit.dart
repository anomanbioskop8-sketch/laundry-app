import 'package:app_laundry/core/auth/session/cubit/session_cubit.dart';
import 'package:app_laundry/core/base/cubit/base_action_cubit.dart';
import 'package:app_laundry/core/constants/strings/company_strings.dart';
import 'package:app_laundry/features/company/domain/usecases/company_params.dart';
import 'package:app_laundry/features/company/domain/usecases/update_company.dart';

class CompanyActionCubit extends BaseActionCubit<void> {
  final UpdateCompany _update;

  final SessionCubit _sessionCubit;

  CompanyActionCubit({
    required UpdateCompany update,
    required SessionCubit sessionCubit,
  }) : _update = update,
       _sessionCubit = sessionCubit;

  Future<void> submit(CompanyParams params) async {
    await execute(
      call: () => _update(params),
      successMessage: CompanyStrings.updateSuccess,
      onSuccess: (data) async {
        _sessionCubit.refreshCompany();
      },
    );
  }
}
