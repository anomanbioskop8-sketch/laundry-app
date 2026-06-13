import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_duration_ext.dart';

extension OrderDateExt on OrderEntity {
  // ===========================================================================
  // DATE
  // ===========================================================================

  DateTime get estimatedFinishAt {
    return createdAt!.add(estimatedDuration);
  }

  DateTime get earliestFinishAt {
    return createdAt!.add(nearestEstimatedDuration);
  }

  // ===========================================================================
  // FORMATTED
  // ===========================================================================

  String get formattedCreatedAt {
    return createdAt?.short ?? '-';
  }

  String get formattedEstimatedFinishAt {
    return estimatedFinishAt.short;
  }

  // ===========================================================================
  // DISPLAY
  // ===========================================================================

  String get createdAtDisplay {
    return 'Masuk: $formattedCreatedAt';
  }

  String get estimatedFinishAtDisplay {
    return 'Estimasi: $formattedEstimatedFinishAt';
  }
}
