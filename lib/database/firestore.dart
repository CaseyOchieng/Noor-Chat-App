// This is the stores posts that users have  published in the app.
// each post has a user details, message, and timestamp

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  //current logged in user
  User? user = FirebaseAuth.instance.currentUser;
  //get  collection of users
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  //post a message
  Future<void> addPost(String message) {
    return posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'timestamp': Timestamp.now(),
    });
  }

  //read posts from database.

  Stream<QuerySnapshot> getPostStream() {
    final postsStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('timestamp', descending: true)
        .snapshots();
    return postsStream;
  }
}
