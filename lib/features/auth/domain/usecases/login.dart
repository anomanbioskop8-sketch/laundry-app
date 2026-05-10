import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';
import 'package:app_laundry/features/auth/domain/usecases/auth_params.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    try {
      return repository.login(params.email, params.pass);
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
