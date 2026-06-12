import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_group_entity.dart';

extension OrderGroupEstimationExt on OrderGroupEntity {
  DateTime estimatedFinishAt(DateTime createdAt) {
    return createdAt.add(estimatedDuration);
  }

  String formattedEstimatedFinishAt(DateTime createdAt) {
    return estimatedFinishAt(createdAt).short;
  }

  int get estimationDays => estimatedDuration.inDays;

  String get estimationLabel {
    switch (estimationDays) {
      case 0:
        return 'Same Day';
      case 1:
        return '1 Hari';
      default:
        return '$estimationDays Hari';
    }
  }

  String get estimationDescription {
    return 'Durasi: $estimationLabel';
  }

  String deadlineLabel(DateTime createdAt) {
    final deadline = estimatedFinishAt(createdAt);
    final remaining = deadline.difference(DateTime.now());

    if (remaining.isNegative) {
      return 'Terlambat';
    }

    if (remaining.inDays > 0) {
      return 'Deadline: ${remaining.inDays} hari lagi';
    }

    if (remaining.inHours > 0) {
      return 'Deadline: ${remaining.inHours} jam lagi';
    }

    if (remaining.inMinutes > 0) {
      return 'Deadline: ${remaining.inMinutes} menit lagi';
    }

    return 'Deadline: kurang dari 1 menit';
  }
}
