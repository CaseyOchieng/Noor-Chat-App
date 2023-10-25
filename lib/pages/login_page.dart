import 'package:flutter/material.dart';
import 'package:noor/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //text controllers for the text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //text controllers for the text fields
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'asset/logo_bg.png',
                color: Theme.of(context).colorScheme.inversePrimary,
                // width: 350,
                fit: BoxFit.scaleDown,
              ),

              //gap
              const SizedBox(
                height: 25,
              ),

              // app name
              const Text('M I N I M A L'),
              const SizedBox(
                height: 25,
              ),
              //email textfield
              MyTextField(
                hint: 'Email',
                obscure: false,
                controller: emailController,
              ),
              //password textfield
              MyTextField(
                hint: 'Password',
                obscure: false,
                controller: passwordController,
              ),
              //forgot password

              // sign up button

              //don't have an account? Register here
            ],
          ),
        ),
      ),
    );
  }
}
