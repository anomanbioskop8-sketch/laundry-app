// =============================================================================
// File        : customer_params.dart
// Path        : lib/features/customer/domain/usecase/customer_params.dart
// Layer       : Domain (Parameters)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan parameter untuk setiap use case customer
// - Memisahkan kebutuhan data berdasarkan aksi:
//   create, update, delete, get, dan save
// - Menyediakan validasi dasar melalui getter `isValid`
// - Menjadi contract data antar Presentation dan Domain Layer
// =============================================================================

/// =========================
/// CREATE CUSTOMER
/// =========================
/// Parameter untuk membuat customer baru
class CreateCustomerParams {
  final String name;
  final String phone;
  final String address;

  const CreateCustomerParams({
    required this.name,
    required this.phone,
    required this.address,
  });

  /// Validasi data customer
  bool get isValid => name.isNotEmpty && phone.isNotEmpty && address.isNotEmpty;
}

/// =========================
/// UPDATE CUSTOMER
/// =========================
/// Parameter untuk memperbarui data customer
class UpdateCustomerParams {
  final String id;
  final String name;
  final String phone;
  final String address;

  const UpdateCustomerParams({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
  });

  /// Validasi data update customer
  bool get isValid =>
      id.isNotEmpty &&
      name.isNotEmpty &&
      phone.isNotEmpty &&
      address.isNotEmpty;
}

/// =========================
/// DELETE CUSTOMER
/// =========================
/// Parameter untuk menghapus customer
class DeleteCustomerParams {
  final String id;

  const DeleteCustomerParams(this.id);

  /// Validasi ID customer
  bool get isValid => id.isNotEmpty;
}

/// =========================
/// GET CUSTOMER
/// =========================
/// Parameter untuk mengambil detail customer
class GetCustomerParams {
  final String id;

  const GetCustomerParams(this.id);

  /// Validasi ID customer
  bool get isValid => id.isNotEmpty;
}

/// =========================
/// SAVE CUSTOMER
/// =========================
/// Parameter untuk proses simpan customer
/// Digunakan untuk create maupun update
class SaveCustomerParams {
  final String? id;
  final String name;
  final String phone;
  final String address;

  const SaveCustomerParams({
    this.id,
    required this.name,
    required this.phone,
    required this.address,
  });

  /// Menentukan apakah proses adalah edit/update
  bool get isEdit => id != null;

  /// Validasi data customer
  bool get isValid => name.isNotEmpty && phone.isNotEmpty && address.isNotEmpty;
}
