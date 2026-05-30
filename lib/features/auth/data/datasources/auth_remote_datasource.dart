import 'package:app_laundry/core/auth/role/user_role.dart';
import 'package:app_laundry/core/constants/firestore_path.dart';
import 'package:app_laundry/core/error/extensions/firebase_exception_extension.dart';
import 'package:app_laundry/core/network/base_remote_datasource.dart';
import 'package:app_laundry/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRemoteDataSource extends BaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSource(super.logger, this.auth, this.firestore);

  /// 🔥 sementara hardcode (nanti pindah ke Session / user_index)
  static const _companyId = 'tQ9XUVI0xvON7k8DMbKg';

  /// =========================
  /// REGISTER
  /// =========================
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    return safeCall(() async {
      try {
        final credential = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final user = credential.user!;
        final uid = user.uid;

        final data = {
          'name': name,
          'email': email,
          'companyId': _companyId,
          'role': UserRole.owner.name,
          'createdAt': FieldValue.serverTimestamp(),
        };

        final ref = FirestorePath.userDoc(firestore, uid);

        await ref.set(data);

        final doc = await ref.get();

        return UserModel.fromMap(doc.data()!, uid);
      } catch (e) {
        throw e.toAppException;
      }
    });
  }

  /// =========================
  /// LOGIN
  /// =========================
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    return safeCall(() async {
      try {
        final credential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        final user = credential.user!;
        final uid = user.uid;

        final ref = FirestorePath.userDoc(firestore, uid);
        final doc = await ref.get();

        /// 🔥 auto create jika belum ada (anti null)
        if (!doc.exists || doc.data() == null) {
          await ref.set({
            'name': user.displayName ?? '',
            'email': user.email ?? '',
            'companyId': _companyId,
            'role': UserRole.owner.name,
            'createdAt': FieldValue.serverTimestamp(),
          });
        }

        final freshDoc = await ref.get();

        return UserModel.fromMap(freshDoc.data()!, uid);
      } catch (e) {
        throw e.toAppException;
      }
    });
  }

  /// =========================
  /// CURRENT USER
  /// =========================
  Future<UserModel?> getCurrentUser() {
    return safeCall(() async {
      final user = auth.currentUser;
      if (user == null) return null;

      final uid = user.uid;

      final ref = FirestorePath.userDoc(firestore, uid);
      final doc = await ref.get();

      if (!doc.exists || doc.data() == null) {
        return null;
      }

      return UserModel.fromMap(doc.data()!, uid);
    });
  }

  /// =========================
  /// LOGOUT
  /// =========================
  Future<void> logout() async {
    await auth.signOut();
  }
}
