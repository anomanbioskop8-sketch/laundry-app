// =============================================================================
// File        : customer_ui_model.dart
// Layer       : Presentation (UI Model)
// -----------------------------------------------------------------------------
// CustomerUIModel
//
// Responsibility:
// - Representasi data khusus UI
// - Sudah siap tampil (formatted)
// - Tidak mengandung business logic domain
// =============================================================================

class CustomerUIModel {
  final String id;
  final String name;
  final String subtitle;
  final String phone;
  final String address;

  const CustomerUIModel({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.phone,
    required this.address,
  });
}
