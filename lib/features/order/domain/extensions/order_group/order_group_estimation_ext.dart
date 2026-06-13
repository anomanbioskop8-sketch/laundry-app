import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/core/extensions/duration_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

extension OrderGroupEstimationExt on OrderGroupEntity {
  // ===========================================================================
  // DATE
  // ===========================================================================

  DateTime estimatedFinishAt(DateTime createdAt) {
    return createdAt.add(estimatedDuration);
  }

  String formattedEstimatedFinishAt(DateTime createdAt) {
    return estimatedFinishAt(createdAt).short;
  }

  // ===========================================================================
  // DURATION
  // ===========================================================================

  int get estimationDays {
    return estimatedDuration.inDays;
  }

  String get estimationDurationLabel {
    switch (estimationDays) {
      case 0:
        return 'Same Day';
      case 1:
        return '1 Hari';
      default:
        return '$estimationDays Hari';
    }
  }

  // ===========================================================================
  // ESTIMATION
  // ===========================================================================

  String estimationLabel(DateTime createdAt) {
    final remaining = estimatedFinishAt(createdAt).difference(DateTime.now());

    return remaining.remainingLabel;
  }

  // ===========================================================================
  // DISPLAY
  // ===========================================================================

  String get estimationDurationDisplay {
    return 'Durasi: $estimationDurationLabel';
  }

  String estimationDisplay(DateTime createdAt) {
    return 'Estimasi: ${estimationLabel(createdAt)}';
  }
}
