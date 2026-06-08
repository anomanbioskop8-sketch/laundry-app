import 'package:app_laundry/core/errors/exceptions.dart';
import 'package:app_laundry/core/errors/extensions/app_exception_ext.dart';
import 'package:app_laundry/core/errors/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app_laundry/features/auth/data/mappers/user_mapper_ext.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final model = await remote.getCurrentUser();

      /// 🔥 Null safe mapping
      if (model == null) {
        return const Right(null);
      }

      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final model = await remote.login(email: email, password: password);
      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final model = await remote.register(
        name: name,
        email: email,
        password: password,
      );
      return Right(model.toEntity);
    } on AppException catch (e) {
      return Left(e.toFailure);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return Right(await remote.logout());
  }
}
