import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/error/mappers/firebase_error_mapper.dart';
import 'package:app_laundry/core/network/base_remote_datasource.dart';
import 'package:app_laundry/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource extends BaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSource(super.logger, this.auth, this.firestore);

  /// REGISTER
  Future<UserModel> register(String name, String email, String password) async {
    return safeCall(() async {
      try {
        final credential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final uid = credential.user!.uid;
        //final companyId = 'const Uuid().v4()';

        final userModel = UserModel(
          id: uid,
          name: name,
          email: email,
          companyId: 'tQ9XUVI0xvON7k8DMbKg',
          role: UserRole.owner,
        );

        return userModel;
      } catch (e) {
        throw FirebaseErrorMapper.map(e);
      }
    });
  }

  /// LOGIN
  Future<UserModel> login(String email, String password) async {
    return safeCall(() async {
      try {
        final credential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        final user = credential.user;
        return UserModel(
          id: user?.uid ?? '-',
          name: user?.displayName ?? '-',
          email: user?.email ?? '-',
          companyId: 'tQ9XUVI0xvON7k8DMbKg',
          role: UserRole.owner,
        );
      } catch (e) {
        throw FirebaseErrorMapper.map(e);
      }
    });
  }

  /// CURRENT USER
  Future<UserModel?> getCurrentUser() {
    return safeCall(() async {
      try {
        final user = auth.currentUser;

        if (user == null) return null;

        return UserModel(
          id: user.uid,
          name: user.displayName ?? '',
          email: user.email ?? '',
          companyId: 'tQ9XUVI0xvON7k8DMbKg',
          role: UserRole.owner,
        );
      } catch (e) {
        throw FirebaseErrorMapper.map(e);
      }
    });
  }

  Future<void> logout() async {
    await auth.signOut();
  }
}
