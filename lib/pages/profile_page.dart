// ignore_for_file: must_be_immutable
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

            return Center(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 50.0,
                      left: 25.0,
                    ),
                    child: Row(
                      children: [
                        BackButton(),
                      ],
                    ),
                  ),
                  // Profile pic
                  // Sized box
                  const SizedBox(
                    height: 25,
                  ),
                  // Sized box

                  Container(
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      'asset/profile.png',
                      width: 200,
                    ),
                  ),
                  // const Divider(),
                  const SizedBox(
                    height: 25,
                  ),
                  //Name of user
                  Text(
                    user!['username'].toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Email
                  Text(
                    user['email'].toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
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
