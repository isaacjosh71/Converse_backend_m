import 'package:afsoen/core/exceptions/app_exception.dart';
import 'package:afsoen/core/service/firebase_service.dart';
import 'package:afsoen/features/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepo = Provider((ref) => AuthRepository(
      ref.watch(fireStoreServiceProvider),
      ref.watch(firebaseAuthProvider),
    ));

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  AuthRepository(this._firestore, this._auth);

  Future<UserCredential> register({required String email, required String phone, required String password}) async {
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credentials;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AppException(message: 'You entered a weak password');
      } else if (e.code == 'email-already-in-use') {
        throw AppException(message: 'The entered email already exists');
      } else {
        throw AppException(message: e.message);
      }
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<void> setUpUser(UserModel user) async {
    try {
      await _firestore.collection('Users').doc(user.uid).set(user.toJson());
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AppException(message: e.message);
    }
  }
}
