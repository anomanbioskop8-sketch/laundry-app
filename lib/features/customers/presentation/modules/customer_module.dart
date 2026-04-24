// =============================================================================
// File        : customer_module.dart
// Path        : features/customers/presentation/modules/customer_module.dart
// Layer       : Presentation (SaaS V4 Module Config)
// -----------------------------------------------------------------------------
// CustomerModule (SaaS V4)
//
// Responsibility:
// - Menjadi single source of truth untuk fitur Customer
// - Mendefinisikan:
//   - Data source (stream)
//   - Field form (auto generate)
//   - Actions (detail, edit, delete)
//   - Permission (optional)
//
// Notes:
// - Tidak ada business logic di sini
// - Semua usecase tetap di domain layer
// - Digunakan oleh AutoListPage & AutoFormPage
// =============================================================================

import 'package:flutter/material.dart';

import '../../domain/entities/customer_entity.dart';
import '../../domain/usecases/params/customer_params.dart';
import '../../domain/usecases/stream_customers_usecase.dart';

import '../../../../core/saas/config/module_config.dart';
import '../../../../core/saas/config/field_config.dart';
import '../../../../core/saas/config/action_config.dart';
import '../../../../core/saas/config/permission_config.dart';

class CustomerModule {
  /// ===========================================================================
  /// BUILD MODULE
  /// ===========================================================================
  static ModuleConfig<CustomerEntity> build({
    required String companyId,
    required StreamCustomersUseCase streamUseCase,

    /// 🔥 ACTION HANDLER (di-inject dari luar)
    required Future<void> Function(String id) deleteCustomer,
    required void Function(BuildContext context, CustomerEntity c) onDetail,
    required void Function(BuildContext context, CustomerEntity c) onEdit,
  }) {
    return ModuleConfig<CustomerEntity>(
      // =========================================================
      // META
      // =========================================================
      name: "Customer",

      // =========================================================
      // DATA SOURCE
      // =========================================================
      stream: () => streamUseCase(StreamCustomerParams(companyId)),

      itemBuilder: (context, c) {
        return ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(c.name),
          subtitle: Text("${c.phone} • ${c.address}"),
        );
      },

      // =========================================================
      // AUTO FORM (🔥 CORE V4)
      // =========================================================
      fields: const [
        FieldConfig(
          name: "name",
          label: "Nama",
          type: FieldType.text,
          required: true,
        ),
        FieldConfig(name: "phone", label: "Telepon", type: FieldType.phone),
        FieldConfig(name: "address", label: "Alamat", type: FieldType.textarea),
      ],

      // =========================================================
      // ACTIONS (🔥 FULLY DYNAMIC)
      // =========================================================
      actions: [
        ActionConfig<CustomerEntity>(
          label: "Detail",
          icon: Icons.info,
          onTap: (context, item) async {
            onDetail(context, item);
          },
        ),

        ActionConfig<CustomerEntity>(
          label: "Edit",
          icon: Icons.edit,
          onTap: (context, item) async {
            onEdit(context, item);
          },
        ),

        ActionConfig<CustomerEntity>(
          label: "Delete",
          icon: Icons.delete,
          onTap: (context, item) async {
            await deleteCustomer(item.id);
          },
        ),
      ],

      // =========================================================
      // PERMISSION (OPTIONAL)
      // =========================================================
      permission: const PermissionConfig(
        canCreate: true,
        canUpdate: true,
        canDelete: true,
      ),
    );
  }

  /// ===========================================================================
  /// FORM → ENTITY MAPPER
  /// ===========================================================================
  ///
  /// Digunakan oleh AutoFormPage
  ///
  static CustomerEntity mapper(Map<String, dynamic> map) {
    return CustomerEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      companyId: map['companyId'] ?? '',
    );
  }
}
