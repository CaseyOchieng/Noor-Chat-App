// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:noor/components/my_button.dart';
import 'package:noor/components/my_textfield.dart';
import 'package:noor/pages/helper_function.dart';

class LoginPage extends StatefulWidget {
  //text controllers for the text fields

  final void Function()? onTap;
  //text controllers for the text fields
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //The Login function
  void login() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
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
                text: 'Login',
                onTap: login,
              ),
              const SizedBox(
                height: 25,
              ),
              //don't have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?    ",
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
