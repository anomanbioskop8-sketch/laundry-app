class PermissionConfig {
  final bool canCreate;
  final bool canUpdate;
  final bool canDelete;

  const PermissionConfig({
    this.canCreate = true,
    this.canUpdate = true,
    this.canDelete = true,
  });
}
