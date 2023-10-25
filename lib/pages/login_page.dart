import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'asset/logo_bg.png',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            // app name

            //email textfield

            //password textfield

            //forgot password

            // sign up button

            //don't have an account? Register here
          ],
        ),
      ),
    );
  }
}
