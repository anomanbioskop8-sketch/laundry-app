import 'package:app_laundry/features/company/domain/entities/company_entity.dart';

class CompanyParams {
  final CompanyEntity current;

  final String name;
  final String phone;
  final String address;

  const CompanyParams({
    required this.current,
    required this.name,
    required this.phone,
    required this.address,
  });
}
