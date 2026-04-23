import 'package:cloud_firestore/cloud_firestore.dart';
import '../exceptions.dart';

class FirebaseErrorMapper {
  /// ===============================
  /// FirebaseException → AppException
  /// ===============================
  static AppException toException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return PermissionException('Tidak punya izin akses');

      case 'not-found':
        return NotFoundException('Data tidak ditemukan');

      case 'unavailable':
        return NetworkException('Layanan tidak tersedia');

      case 'deadline-exceeded':
        return TimeoutException('Request timeout');

      case 'resource-exhausted':
        return ServerException('Quota habis');

      case 'already-exists':
        return ServerException('Data sudah ada');

      case 'cancelled':
        return ServerException('Request dibatalkan');

      case 'invalid-argument':
        return ServerException('Data tidak valid');

      default:
        return UnknownException('Terjadi kesalahan (${e.code})');
    }
  }
}
