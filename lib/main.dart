import 'package:flutter/material.dart';
import 'package:beach_volleyball/screens/home_screen.dart';
import 'package:beach_volleyball/theme/app_theme.dart';

void main() {
  runApp(const BeachVolleyballApp());
}

class BeachVolleyballApp extends StatelessWidget {
  const BeachVolleyballApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beach Volleyball Tournament Manager',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}