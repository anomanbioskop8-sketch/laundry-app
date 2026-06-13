// lib/core/extensions/duration_ext.dart

extension DurationExt on Duration {
  String get remainingLabel {
    if (isNegative) {
      return 'Terlambat';
    }

    if (inDays > 0) {
      return '$inDays hari lagi';
    }

    if (inHours > 0) {
      return '$inHours jam lagi';
    }

    if (inMinutes > 0) {
      return '$inMinutes menit lagi';
    }

    return '< 1 menit';
  }
}
