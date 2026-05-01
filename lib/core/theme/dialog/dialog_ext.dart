import 'package:app_laundry/core/theme/dialog/dialog_color_mapper.dart';
import 'package:app_laundry/core/theme/dialog/dialog_icon_mapper.dart';
import 'package:app_laundry/core/theme/dialog/dialog_type.dart';
import 'package:flutter/material.dart';

extension DialogTypeExt on DialogType {
  Color color(BuildContext context) => DialogColorMapper.color(context, this);

  IconData icon() => DialogIconMapper.icon(this);
}
