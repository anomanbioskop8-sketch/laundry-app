import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_order_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_service_type_ext.dart';
import 'package:app_laundry/features/laundry/domain/extensions/laundry_speed_type_ext.dart';
import 'package:flutter/material.dart';

extension OrderGroupDisplayExt on OrderGroupEntity {
  String get serviceLabel => serviceType.label;

  String get orderLabel => orderType.label;

  String get speedLabel => speedType.label;

  IconData get serviceIcon => serviceType.icon;

  IconData get orderIcon => orderType.icon;

  IconData get speedIcon => speedType.icon;

  Color speedColor(BuildContext context) => speedType.color(context);
}
