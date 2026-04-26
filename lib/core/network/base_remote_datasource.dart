import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/utils/logger_service.dart';

abstract class BaseRemoteDataSource {
  final LoggerService logger;

  BaseRemoteDataSource(this.logger);

  /// =========================
  /// 🔥 SAFE FUTURE CALL
  /// =========================
  Future<T> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on AppException {
      rethrow;
    } catch (error, stack) {
      logger.error(error, stack);

      throw const UnknownException('Terjadi kesalahan tidak diketahui');
    }
  }

  /// =========================
  /// 🔥 SAFE STREAM
  /// =========================
  Stream<T> safeStream<T>(Stream<T> Function() stream) {
    try {
      return stream().handleError((error, stack) {
        logger.error(error, stack);

        if (error is AppException) {
          throw error;
        }

        throw const UnknownException('Terjadi kesalahan pada stream');
      });
    } catch (error, stack) {
      logger.error(error, stack);

      return Stream.error(const UnknownException('Gagal membuat stream'));
    }
  }
}
