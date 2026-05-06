import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/error/mappers/failure_mapper.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app_laundry/features/auth/data/mappers/user_mapper_ext.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<Failure, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final model = await remote.login(email, password);
      return Right(model.toEntity());
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final model = await remote.register(name, email, password);
      return Right(model.toEntity());
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final model = await remote.getCurrentUser();

      /// 🔥 Null safe mapping
      if (model == null) {
        return const Right(null);
      }

      final entity = model.toEntity();

      return Right(entity);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return Right(await remote.logout());
  }
}
