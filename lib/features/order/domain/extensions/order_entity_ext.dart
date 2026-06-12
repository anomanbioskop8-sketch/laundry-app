// =============================================================================
// File : order_entity_ext.dart
// Path : features/order/domain/extensions/order_entity_ext.dart
// =============================================================================

import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/utils/formatters/currency_formatter.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order_status/order_status_flag_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_group/order_group_list_ext.dart';

extension OrderEntityExt on OrderEntity {
  // ===========================================================================
  // PRICE
  // ===========================================================================

  int get subtotal => groups.grandTotal;

  String get formattedTotal => CurrencyFormatter.idr(total);

  // ===========================================================================
  // DATE
  // ===========================================================================

  String get formattedCreatedAt => createdAt.short;

  DateTime get deadlineAt {
    return createdAt!.add(groups.longestDuration);
  }

  DateTime get nearestDeadlineAt {
    return createdAt!.add(groups.shortestDuration);
  }

  String get estimatedFinishedAtFormatted {
    return deadlineAt.short;
  }

  // ===========================================================================
  // DURATION
  // ===========================================================================

  Duration get deadlineDuration {
    return groups.longestDuration;
  }

  Duration get nearestDeadlineDuration {
    return groups.shortestDuration;
  }

  // ===========================================================================
  // ESTIMATION LABEL
  // ===========================================================================

  String get deadlineLabel {
    if (orderStatus.isReady) {
      return 'Selesai';
    }

    final remaining = deadlineAt.difference(DateTime.now());

    if (remaining.isNegative) {
      return 'Terlambat';
    }

    if (remaining.inDays > 0) {
      return 'Estimasi: ${remaining.inDays} hari lagi';
    }

    if (remaining.inHours > 0) {
      return 'Estimasi: ${remaining.inHours} jam lagi';
    }

    if (remaining.inMinutes > 0) {
      return 'Estimasi: ${remaining.inMinutes} menit lagi';
    }

    return 'Estimasi: < 1 menit';
  }

  String get nearestDeadlineLabel {
    if (orderStatus.isReady) {
      return 'Selesai';
    }

    final remaining = nearestDeadlineAt.difference(DateTime.now());

    if (remaining.isNegative) {
      return 'Terlambat';
    }

    if (remaining.inDays > 0) {
      return '${remaining.inDays} hari lagi';
    }

    if (remaining.inHours > 0) {
      return '${remaining.inHours} jam lagi';
    }

    if (remaining.inMinutes > 0) {
      return '${remaining.inMinutes} menit lagi';
    }

    return '< 1 menit';
  }
}
