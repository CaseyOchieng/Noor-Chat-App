import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noor/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    );
  }
}
