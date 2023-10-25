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
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: const Text(
          'Noor Gallery',
          style: TextStyle(fontSize: 18, fontFamily: 'Poppins'),
        ),
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(Icons.person),
          )
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
