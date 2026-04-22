import 'package:app_laundry/core/error/exceptions.dart';

abstract class BaseRemoteDataSource {
  Future<T> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } catch (e) {
      throw ServerException('Error');
    }
  }

  Stream<T> safeStream<T>(Stream<T> Function() stream) {
    try {
      return stream().handleError((error, stack) {});
    } catch (e, stack) {
      return Stream.error(ServerException('Stream init error'));
    }
  }
}
