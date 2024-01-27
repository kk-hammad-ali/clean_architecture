import 'package:clean_architecture/core/errors/exception.dart';
import 'package:clean_architecture/core/utils/constants.dart';
import 'package:clean_architecture/features/auth/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserLocalDataSource {
  Future<void> loginUser(String email, String password);
  Future<void> createUserAccount({
    required String email,
    required String bio,
    required String name,
    required int age,
    required String password,
  });
}

class UserLocalDataSourceImplementation extends UserLocalDataSource {
  FirebaseAuth auth;
  FirebaseFirestore firebaseFirestore;
  UserLocalDataSourceImplementation(this.auth, this.firebaseFirestore);

  @override
  Future<void> createUserAccount({
    required String email,
    required String bio,
    required String name,
    required int age,
    required String password,
  }) async {
    try {
      final user = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userModel = UserModel(
        id: user.user!.uid,
        name: name,
        bio: bio,
        age: age,
        email: email,
      );

      await firebaseFirestore.collection(usersCollection).doc(userModel.id).set(
            userModel.toMap(),
          );
    } catch (e) {
      throw AuthException("Failed to create user account",
          originalMessage: e.toString());
    }
  }

  @override
  Future<void> loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const AuthException("User not found for this email");
      } else if (e.code == 'wrong-password') {
        throw const AuthException("Wrong password provided for this user");
      } else {
        throw AuthException("Failed to log in", originalMessage: e.toString());
      }
    } catch (e) {
      throw AuthException("Failed to log in", originalMessage: e.toString());
    }
  }
}
