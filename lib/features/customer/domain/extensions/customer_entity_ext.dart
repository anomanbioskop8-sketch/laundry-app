import 'package:app_laundry/features/customer/domain/entities/customer_entity.dart';

extension CustomerEntityExt on CustomerEntity? {
  String get selectedCustomerName {
    return this?.name.isNotEmpty == true ? this!.name : 'Pilih Pelanggan';
  }

  String get selectedCustomerPhone {
    return this?.phone.isNotEmpty == true
        ? this!.phone
        : 'Belum ada customer dipilih';
  }
}
