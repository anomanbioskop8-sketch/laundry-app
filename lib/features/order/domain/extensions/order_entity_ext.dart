// features/order/domain/extensions/order_entity_ext.dart

import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group_entity_ext.dart';

extension OrderEntityExt on OrderEntity {
  int get subtotal => groups.grandTotal;

  /// =========================
  /// FORMATTING
  /// =========================

  String get formattedTotal => CurrencyFormatter.idr(total);

  String get formattedCreatedAt => createdAt.short;

  String get estimatedFinishedAtFormatted => deadlineAt.short;

  DateTime get deadlineAt => createdAt!.add(groups.longestDuration);

  DateTime get nearestDeadlineAt => createdAt!.add(groups.shortestDuration);

  Duration? get deadlineDuration {
    if (groups.isEmpty) {
      return null;
    }

    return groups.longestDuration;
  }

  Duration? get nearestDeadlineDuration {
    if (groups.isEmpty) {
      return null;
    }

    return groups.shortestDuration;
  }
}
