// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noor/components/my_button.dart';
import 'package:noor/components/my_textfield.dart';
import 'package:noor/pages/helper_function.dart';

class RegisterPage extends StatefulWidget {
  //text controllers for the text fields

  final void Function()? onTap;
  //text controllers for the text fields
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //The Login function
  void registerUser() async {
// show loading circle
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
// make sure the passwords match
    if (passwordController.text != confirmPwController.text) {
      //Show loading icon
      Navigator.pop(context);
      displayMessageToUser('Passwords do not Match !😞', context);
    } else {
      try {
        // ignore: unused_local_variable
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        //create a user document.
        createUserDocument(userCredential);

        // Loading page
        if (context.mounted) Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);

        // Display error message
        displayMessageToUser(e.code, context);
      }
    }
  }
// try making  new user document and collect them in the firebase.

  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': usernameController.text,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              ClipRRect(
                child: Image.asset(
                  'asset/logo_bg.png',
                  color: Theme.of(context).colorScheme.inversePrimary,
                  width: 300,
                  fit: BoxFit.scaleDown,
                ),
              ),

              //gap
              const SizedBox(
                height: 25,
              ),

              // app name
              const Text('M I N I M A L'),
              const SizedBox(
                height: 50,
              ),
              MyTextField(
                hint: 'Username',
                obscure: false,
                controller: usernameController,
              ),

              //password textfield
              const SizedBox(
                height: 10,
              ),
              //email textfield
              MyTextField(
                hint: 'Email',
                obscure: false,
                controller: emailController,
              ),
              //password textfield
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                hint: 'Password',
                obscure: true,
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                hint: 'Confirm Password',
                obscure: true,
                controller: confirmPwController,
              ),
              // password textfield
              const SizedBox(
                height: 10,
              ),
              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              // sign up button
              MyButtons(
                text: 'Register',
                onTap: registerUser,
              ),
              const SizedBox(
                height: 25,
              ),
              //don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?    ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Register Here",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
