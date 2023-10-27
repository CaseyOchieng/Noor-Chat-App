import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noor/components/my_list_tile.dart';
import 'package:noor/pages/helper_function.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          // any error handling
          if (snapshot.hasError) {
            displayMessageToUser('Error: ${snapshot.error}', context);
          }
          //show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Center(
              child: Text('No Data'),
            );
          }
          // get all users
          final users = snapshot.data!.docs;
          return Column(
            children: [
              //Button
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
              //Button
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    // get individual user
                    final user = users[index];
                    // get data from each user.
                    String username = user['username'];
                    String email = user['email'];
                    // return from each user
                    return MyListTile(
                      title: username,
                      subtitle: email,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
