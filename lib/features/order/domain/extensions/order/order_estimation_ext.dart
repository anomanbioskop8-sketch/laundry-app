import 'package:app_laundry/core/extensions/duration_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_date_ext.dart';
import 'package:app_laundry/features/order/domain/extensions/order_status/order_status_flag_ext.dart';

extension OrderEstimationExt on OrderEntity {
  // ===========================================================================
  // LABEL
  // ===========================================================================

  String get estimationLabel {
    if (orderStatus.isReady) {
      return 'Selesai';
    }

    final finishAt = estimatedFinishAt;
    if (finishAt == null) return '-';

    final remaining = finishAt.difference(DateTime.now());
    return remaining.remainingLabel;
  }

  String get earliestEstimationLabel {
    if (orderStatus.isReady) {
      return 'Selesai';
    }

    final finishAt = earliestFinishAt;
    if (finishAt == null) return '-';

    final remaining = finishAt.difference(DateTime.now());
    return remaining.remainingLabel;
  }

  // ===========================================================================
  // DISPLAY
  // ===========================================================================

  String get estimationDisplay {
    return 'Estimasi: $estimationLabel';
  }

  String get earliestEstimationDisplay {
    return 'Estimasi Terdekat: $earliestEstimationLabel';
  }
}
