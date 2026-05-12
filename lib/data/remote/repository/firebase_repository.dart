import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/data/model/user.dart' as Model;

import '../../../domain/constants/app_constants.dart';

class FirebaseRepository {
  static final FirebaseAuth fireAuth = FirebaseAuth.instance;
  static final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static const String collectionUsers = "users";

  Future<void> registerUser(Model.User user, String pass) async {
    try {
      UserCredential userCred = await fireAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: pass,
      );
      if (userCred.user != null) {
        user.userId = userCred.user!.uid;
        await fireStore
            .collection(collectionUsers)
            .doc(user.userId)
            .set(user.toMap())
            .onError((e, stacktrace) {
              throw Exception(e.toString());
            });
      } else {
        throw Exception("Error while creating user!");
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      UserCredential credential = await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(AppConstants.keyUserId, credential.user!.uid);
      } else {
        throw Exception("Something went wrong!");
      }
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAllUsers() async {
    try {
      return await fireStore.collection(collectionUsers).get();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
