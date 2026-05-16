import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_clone/data/model/message.dart';
import 'package:whatsapp_clone/data/model/user.dart' as Model;

import '../../../domain/constants/app_constants.dart';

class FirebaseRepository {
  static final FirebaseAuth fireAuth = FirebaseAuth.instance;
  static final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  static const String collectionUsers = "users";
  static const String collectionChatroom = "chatroom";
  static const String collectionMessages = "messages";

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

  static Future<String> getCurrentUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyUserId) ?? "";
  }

  static String getChatroomId(String fromId, String toId) {
    if (fromId.hashCode <= toId.hashCode) {
      return "${fromId}_$toId";
    }
    return "${toId}_$fromId";
  }

  static Future<void> sendMessage(
    String toId,
    int msgType,
    String? msg,
    String? imageUrl,
    bool isNewConversation,
  ) async {
    String fromId = await getCurrentUserId();
    String chatroomId = getChatroomId(fromId, toId);
    int currTime = DateTime.now().millisecondsSinceEpoch;

    Message message = Message(
      msgId: "$currTime",
      message: msg,
      imageUrl: imageUrl,
      sentAt: currTime,
      recAt: null,
      readAt: null,
      fromId: fromId,
      toId: toId,
      msgType: msgType,
    );

    try {
      if (isNewConversation) {
        await fireStore
            .collection(collectionChatroom)
            .doc(chatroomId)
            .set({
              "ids": [fromId, toId],
            })
            .onError((e, s) {
              throw Exception(e.toString());
            });
      }
      await fireStore
          .collection(collectionChatroom)
          .doc(chatroomId)
          .collection(collectionMessages)
          .doc("$currTime")
          .set(message.toMap())
          .onError((e, s) {
            throw Exception(e.toString());
          });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getChatStream(
    String fromId,
    String toId,
  ) {
    return fireStore
        .collection(collectionChatroom)
        .doc(getChatroomId(fromId, toId))
        .collection(collectionMessages)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getContacts(
    String fromId,
  ) {
    try {
      return fireStore
          .collection(collectionChatroom)
          .where("ids", arrayContains: fromId)
          .snapshots();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> getUserFromUserId(
    String userId,
  ) {
    return fireStore.collection(collectionUsers).doc(userId).get();
  }

  static void updateMessageReadStatus(
    String fromId,
    String toId,
    String msdId,
  ) {
    fireStore
        .collection(collectionChatroom)
        .doc(getChatroomId(fromId, toId))
        .collection(collectionMessages)
        .doc(msdId)
        .update({"readAt": DateTime.now().millisecondsSinceEpoch});
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
    String fromId,
    String toId,
  ) {
    return fireStore
        .collection(collectionChatroom)
        .doc(getChatroomId(fromId, toId))
        .collection(collectionMessages)
        .orderBy("sentAt", descending: true)
        .limit(1)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getUnreadCount(
    String fromId,
    String toId,
  ) {
    return fireStore
        .collection(collectionChatroom)
        .doc(getChatroomId(fromId, toId))
        .collection(collectionMessages)
        .where("fromId", isEqualTo: toId)
        .where("readAt", isNull: true)
        .snapshots();
  }
}
