// lib/screens/problem_detail_screen.dart
import 'package:flutter/material.dart';

class ProblemDetailScreen extends StatelessWidget {
  final String problemName;

  const ProblemDetailScreen({super.key, required this.problemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(problemName)),
      body: Center(
        child: Text(
          '🧠 $problemName\n\n(Coming Soon...)',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
