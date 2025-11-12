// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_dsa/dsa_problems/arrays/contains_duplicate.dart';
import 'package:flutter_dsa/dsa_problems/arrays/move_zeroes.dart';
import 'package:flutter_dsa/dsa_problems/arrays/three_sum.dart';
import 'dsa_problems/arrays/remove_duplicates_from_sorted_array.dart';
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
      home: const TripletFinderApp(),
    );
  }
}
