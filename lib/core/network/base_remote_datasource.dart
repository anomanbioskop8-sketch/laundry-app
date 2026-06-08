// =============================================================================
// File        : base_remote_datasource.dart
// Path        : lib/core/network/base_remote_datasource.dart
// Layer       : Core (Data)
// -----------------------------------------------------------------------------
// Fungsi:
// - Menyediakan helper untuk safe call (Future & Stream)
// - Menangani logging & mapping error secara konsisten
// =============================================================================

import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/utils/logger_service.dart';

abstract class BaseRemoteDataSource {
  final LoggerService _logger;

  const BaseRemoteDataSource(this._logger);

  // =========================
  // SAFE FUTURE CALL
  // =========================

  Future<T> safeCall<T>(
    Future<T> Function() call, {
    String? errorMessage,
  }) async {
    try {
      return await call();
    } on AppException {
      rethrow;
    } catch (error, stackTrace) {
      _logger.error(error, stackTrace);

      throw UnknownException(
        errorMessage ?? 'Terjadi kesalahan tidak diketahui',
      );
    }
  }

  // =========================
  // SAFE STREAM
  // =========================

  Stream<T> safeStream<T>(Stream<T> Function() stream, {String? errorMessage}) {
    final message = errorMessage ?? 'Terjadi kesalahan pada stream';

    try {
      return stream().handleError((error, stackTrace) {
        _logger.error(error, stackTrace);

        if (error is AppException) {
          throw error;
        }

        throw UnknownException(message);
      });
    } catch (error, stackTrace) {
      _logger.error(error, stackTrace);

      return Stream.error(UnknownException('Gagal membuat stream'));
    }
  }
}
