import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/browse_page.dart';
import 'pages/messages_page.dart';
import 'pages/profile_page.dart';
import 'pages/login_page.dart';
import 'pages/main_screen.dart';

void main() {
  runApp(const UniSwapApp());
}

class UniSwapApp extends StatelessWidget {
  const UniSwapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniSwap',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomePage(),
        '/browse': (context) => const BrowsePage(),
        '/messages': (context) => const MessagesPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
