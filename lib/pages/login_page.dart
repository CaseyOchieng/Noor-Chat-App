import 'package:flutter/material.dart';
import 'package:noor/components/my_button.dart';
import 'package:noor/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //text controllers for the text fields

  final void Function()? onTap;
  //text controllers for the text fields
  LoginPage({super.key, this.onTap});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //The Login function
  void login() async {
    //loading circle
  }

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
                    onTap: onTap,
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
