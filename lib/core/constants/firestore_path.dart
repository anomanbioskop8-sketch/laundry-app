import 'package:cloud_firestore/cloud_firestore.dart';

class FirestorePath {
  FirestorePath._();

  static const users = 'users';
  static const companies = 'companies';

  static DocumentReference<Map<String, dynamic>> userDoc(
    FirebaseFirestore firestore,
    String uid,
  ) {
    return firestore.collection(users).doc(uid);
  }
}
