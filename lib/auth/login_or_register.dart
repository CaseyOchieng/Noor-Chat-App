import 'package:flutter/material.dart';
import 'package:noor/pages/login_page.dart';
import 'package:noor/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
// Initialize the login
  bool showLoginPage = true;
  // Initialize the login
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return RegisterPage(onTap: togglePages);
    }
  }
}



// The code starts by declaring a boolean variable called showLoginPage.
// The code then initializes the variable to true.
// Next, it declares an anonymous function that takes no arguments and returns void.
// This is known as an inline function because it's defined within another function without being declared outside of the other function.
// The togglePages() method is then created which will be used to change the value of showLoginPage from true to false when executed in order to hide or display the login page depending on its current state.
// The code sets a boolean variable showLoginPage to true or false.
// The togglePages() function is called when the user clicks on the Login button in the top-left corner of the screen.
// The togglePages() function checks if showLoginPage is set to true and changes its value accordingly.