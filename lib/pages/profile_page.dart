// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  //current user logged in
  User? currentUser = FirebaseAuth.instance.currentUser;

  // future fetch use data
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>?>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // Loading Circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // error handling
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          // data handling
          else if (snapshot.hasData) {
            //extracting data
            Map<String, dynamic>? user = snapshot.data?.data();

            return Column(
              children: [
                // Profile pic
                // Image.asset('asset/profile.png'),
                //Name of user
                Text(
                  user!['username'].toString(),
                  style: const TextStyle(),
                ),
                //Email
                Text(
                  user['email'].toString(),
                  style: const TextStyle(),
                )
              ],
            );
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
    );
  }
}
