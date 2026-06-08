import 'package:app_laundry/core/form/fields/form_option.dart';
import 'package:app_laundry/core/ui/widgets/forms/app_dropdown_item.dart';
import 'package:flutter/material.dart';

extension FormOptionDropdownExt on List<FormOption> {
  List<DropdownMenuItem<String>> toDropdownItems() {
    return map(
      (e) => DropdownMenuItem<String>(
        value: e.value,
        child: AppDropdownItem(label: e.label, icon: e.icon),
      ),
    ).toList();
  }
}
