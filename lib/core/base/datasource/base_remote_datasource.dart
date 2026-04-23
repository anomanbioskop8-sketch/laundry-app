import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/mappers/firebase_error_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class BaseRemoteDataSource {
  Future<T> safeCall<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on FirebaseException catch (e) {
      throw FirebaseErrorMapper.toException(e);
    } on AppException {
      rethrow;
    } catch (e) {
      throw const UnknownException('Terjadi kesalahan tidak diketahui');
    }
  }

  Stream<T> safeStream<T>(Stream<T> Function() stream) {
    try {
      return stream().handleError((error) {
        if (error is FirebaseException) {
          throw FirebaseErrorMapper.toException(error);
        } else if (error is AppException) {
          throw error;
        } else {
          throw const UnknownException('Stream error');
        }
      });
    } catch (e, stack) {
      debugPrint(e.toString());
      debugPrint(stack.toString());
      throw const UnknownException('Terjadi kesalahan');
    }
  }
}
