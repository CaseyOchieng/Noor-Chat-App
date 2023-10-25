import 'package:flutter/material.dart';
import 'package:noor/pages/login_page.dart';
import 'package:noor/theme/dark_mode.dart';
import 'package:noor/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      home: const LoginPage(),
    );
  }
}
