import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/extensions/unauthorized_exception_ext.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';
import 'package:app_laundry/features/auth/domain/usecases/params/register_params.dart';

class Register {
  final AuthRepository repository;

  Register(this.repository);

  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    try {
      return repository.register(
        name: params.name,
        email: params.email,
        password: params.password,
      );
    } on UnauthorizedException catch (e) {
      return Left(e.failure);
    }
  }
}
