import 'package:app_laundry/core/error/failure.dart';
import 'package:app_laundry/core/utils/either.dart';
import 'package:app_laundry/features/auth/domain/entities/user_entity.dart';
import 'package:app_laundry/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUser {
  final AuthRepository repository;

  GetCurrentUser(this.repository);

  Future<Either<Failure, UserEntity?>> call() {
    return repository.getCurrentUser();
  }
}
