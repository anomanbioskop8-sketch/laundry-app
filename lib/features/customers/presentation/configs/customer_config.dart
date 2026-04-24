import 'package:app_laundry/core/saas/models/crud_action.dart';
import 'package:app_laundry/core/saas/config/crud_config.dart';
import 'package:app_laundry/features/customers/domain/entities/customer_entity.dart';
import 'package:flutter/material.dart';

class CustomerConfig {
  static CrudConfig<CustomerEntity> build({
    required Stream<List<CustomerEntity>> Function() stream,
  }) {
    return CrudConfig<CustomerEntity>(
      title: "Customer",

      stream: stream,

      itemBuilder: (c) => ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(c.name),
        subtitle: Text(c.phone),
      ),

      filter: (c, keyword) =>
          c.name.toLowerCase().contains(keyword.toLowerCase()) ||
          c.phone.contains(keyword),

      actions: (context, c) => [
        CrudAction<CustomerEntity>(
          label: "Detail",
          icon: Icons.info,
          onTap: (item) async {},
        ),
        CrudAction<CustomerEntity>(
          label: "Delete",
          icon: Icons.delete,
          color: Colors.red,
          onTap: (item) async {},
        ),
      ],
      label: (CustomerEntity item) => item.name,
    );
  }
}
