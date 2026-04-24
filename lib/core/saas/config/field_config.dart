enum FieldType { text, number, phone, textarea, dropdown }

class FieldConfig {
  final String name;
  final String label;
  final FieldType type;

  final bool required;
  final List<String>? options;

  const FieldConfig({
    required this.name,
    required this.label,
    required this.type,
    this.required = false,
    this.options,
  });
}
