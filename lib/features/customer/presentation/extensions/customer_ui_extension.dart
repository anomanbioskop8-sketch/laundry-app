import 'package:app_laundry/core/theme/tokens/app_colors.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/customer_entity.dart';

extension CustomerUIX on CustomerEntity {
  String get displayName => name;

  String get initials {
    if (displayName.isEmpty) return '?';

    final parts = displayName.trim().split(' ');
    if (parts.length == 1) {
      return parts.first[0].toUpperCase();
    }

    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  Color get avatarColor {
    final colors = AppColors.avatarColors;

    return colors[displayName.hashCode % colors.length];
  }
}
