import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noor/auth/auth.dart';
import 'package:noor/firebase_options.dart';
import 'package:noor/pages/home_page.dart';
import 'package:noor/pages/login_page.dart';
import 'package:noor/pages/profile_page.dart';
import 'package:noor/pages/register_page.dart';
import 'package:noor/pages/users_page.dart';
import 'package:noor/theme/dark_mode.dart';
import 'package:noor/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthPage(),
      routes: {
        '/auth': (context) => const AuthPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/users': (context) => const UsersPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
