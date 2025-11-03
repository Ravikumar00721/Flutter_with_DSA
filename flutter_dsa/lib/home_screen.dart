// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_dsa/problem_list_screen.dart';

import 'dsa_data.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = dsaSections.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🧩 DSA Problems'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final sectionName = sections[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(sectionName),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProblemListScreen(
                      sectionName: sectionName,
                      problems: dsaSections[sectionName]!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
