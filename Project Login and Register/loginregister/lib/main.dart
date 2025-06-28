import 'package:flutter/material.dart';
import 'package:loginregister/pages/profile_page.dart';
import 'package:loginregister/pages/welcome_page.dart';
import 'package:loginregister/pages/forgotpassword_page.dart';
import 'package:loginregister/pages/home_page.dart';
import 'package:loginregister/pages/login_page.dart';
import 'package:loginregister/pages/register_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentPage = 0;

  final List<Widget> _pages = [
    const ProfilePage(),
    const WelcomePage(),
    const ForgotPasswordPage(),
    const HomePage(),
    const LoginPage(),
    const RegisterPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: _pages[_currentPage],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentPage,
          onTap: (index) => setState(() => _currentPage = index),
          items: [
            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.blue,
            ),

            /// Login dan Register
            SalomonBottomBarItem(
              icon: const Icon(Icons.lock),
              title: const Text("Login dan Register"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
