import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Future<Either<Failure, UserEntity?>> call() async {
    try {
      return repository.getCurrentUser();
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
