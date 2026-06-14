import 'package:app_laundry/core/extensions/date_time_ext.dart';
import 'package:app_laundry/features/order/domain/entities/order_entity.dart';
import 'package:app_laundry/features/order/domain/extensions/order/order_duration_ext.dart';

extension OrderDateExt on OrderEntity {
  // ===========================================================================
  // SAFE BASE DATE
  // ===========================================================================

  DateTime? get _createdAt => createdAt;

  // ===========================================================================
  // DATE
  // ===========================================================================

  DateTime? get estimatedFinishAt {
    final date = _createdAt;
    if (date == null) return null;
    return date.add(estimatedDuration);
  }

  DateTime? get earliestFinishAt {
    final date = _createdAt;
    if (date == null) return null;
    return date.add(nearestEstimatedDuration);
  }

  // ===========================================================================
  // FORMATTED
  // ===========================================================================

  String get formattedCreatedAt {
    return _createdAt?.short ?? '-';
  }

  String get formattedEstimatedFinishAt {
    return estimatedFinishAt?.short ?? '-';
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
