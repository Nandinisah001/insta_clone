
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  Rx<UserModel> user = UserModel().obs;
  UserModel get userData => user.value;
  String? get userId => FirebaseAuth.instance.currentUser?.uid;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

  getUserData() {
    var userId = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .listen(
          (doc) {
        var data = UserModel.fromJson(jsonDecode(jsonEncode(doc.data())));
        user.value = data;
      },
    );
  }

  addToFollowing(String? authorId) {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      "following": FieldValue.arrayUnion([authorId])

    });
    FirebaseFirestore.instance.collection('users').doc(authorId).update({
      "followers":FieldValue.arrayUnion([userId])
    });
  }
  removeFromFollowing(String? authorId) {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      "following": FieldValue.arrayRemove([authorId])

    });
    FirebaseFirestore.instance.collection('users').doc(authorId).update({
      "followers":FieldValue.arrayRemove([userId])
    });
  }


  void addLikeVideo(String authorId, String videoId ){
    String userId = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection('videos').doc(videoId).update({
      'likes' : FieldValue.arrayUnion([userId]),
      'likeCount' : FieldValue.increment(1),
    });
  }

  void removeFromLike(String authorId, String videoId ){
    String userId = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection('videos').doc(videoId).update({
      'likes' : FieldValue.arrayRemove([userId]),
      'likeCount' : FieldValue.increment(-1),
    });
  }


  void addComment(String authorId, String videoId ){
    String userId = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection('videos').doc(videoId).update({
      'comment' : FieldValue.arrayUnion([userId]),
      'commentCount' : FieldValue.increment(1),
    });
  }

  void removeFromComment(String authorId, String videoId ){
    String userId = FirebaseAuth.instance.currentUser!.uid;

    FirebaseFirestore.instance.collection('videos').doc(videoId).update({
      'likes' : FieldValue.arrayRemove([userId]),
      'likeCount' : FieldValue.increment(-1),
    });
  }

}