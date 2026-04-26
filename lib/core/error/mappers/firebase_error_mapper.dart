import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/exceptions.dart';

class FirebaseErrorMapper {
  static AppException map(Object error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'user-not-found':
          return const NotFoundException('User tidak ditemukan');

        case 'wrong-password':
          return const PermissionException('Password salah');

        case 'email-already-in-use':
          return const ServerException('Email sudah digunakan');

        case 'network-request-failed':
          return const NetworkException('Tidak ada koneksi');

        default:
          return ServerException(error.message ?? 'Firebase error');
      }
    }

    return const UnknownException('Terjadi kesalahan');
  }
}
