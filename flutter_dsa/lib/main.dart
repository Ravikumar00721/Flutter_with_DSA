// lib/main.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const DsaApp());
}

class DsaApp extends StatelessWidget {
  const DsaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DSA Tracker',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
