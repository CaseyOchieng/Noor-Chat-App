import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:noor/components/my_drawer.dart';
import 'package:noor/components/my_list_tile.dart';
import 'package:noor/components/my_post_button.dart';
import 'package:noor/components/my_textfield.dart';
import 'package:noor/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  // firestore access
  final FirestoreDatabase database = FirestoreDatabase();
  // firestore access

//Text controller
  final TextEditingController newPostController = TextEditingController();
//Text controller
  void postMessage() {
// only post message if there is something in the textfield.
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }
    // clear the controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Center(
          child: Text(
            'N O O R  ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          // TextField box for user to type and the button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hint: 'Say something',
                    obscure: false,
                    controller: newPostController,
                  ),
                ),
                // post button
                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),
          // TextField box for user to type and the button
          StreamBuilder(
              stream: database.getPostStream(),
              builder: (context, snapshot) {
                // show loading circle
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                //get all posts
                final posts = snapshot.data!.docs;
                //No data
                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Text('No Posts.. Post something!'),
                  );
                }
                // return list of posts.
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      // get individual post
                      final post = posts[index];
                      // get data from each post.
                      String message = post['PostMessage'];
                      String userEmail = post['UserEmail'];
                      Timestamp timestamp = post['Timestamp'];
                      // return from each post
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MyListTile(
                          title: message,
                          subtitle: userEmail,
                        ),
                      );
                    },
                  ),
                );
              })
        ],
      ),
    );
  }
}
