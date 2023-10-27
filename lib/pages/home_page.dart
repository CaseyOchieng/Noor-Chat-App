import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noor/components/my_drawer.dart';
import 'package:noor/components/my_post_button.dart';
import 'package:noor/components/my_textfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
//Text controller
  final TextEditingController newPostController = TextEditingController();
//Text controller
  void postMessage() {}

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
          // TextField box for user to type
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
                // const SizedBox(
                //   width: 10,
                // ),
                // post button
                PostButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),
          // TextField box for user to type
        ],
      ),
    );
  }
}
