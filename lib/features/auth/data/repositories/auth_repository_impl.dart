import 'package:app_laundry/core/error/exceptions.dart';
import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/error/mappers/failure_mapper.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:app_laundry/features/auth/data/mappers/user_mappper.dart';
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
      final userModel = await remote.login(email, password);
      return Right(UserMappper.toEntity(userModel));
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
      final userModel = await remote.register(name, email, password);
      return Right(UserMappper.toEntity(userModel));
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final userModel = await remote.getCurrentUser();
      return Right(userModel != null ? UserMappper.toEntity(userModel) : null);
    } on AppException catch (e) {
      return Left(FailureMapper.mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return Right(await remote.logout());
  }
}
