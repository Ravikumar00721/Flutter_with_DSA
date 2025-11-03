import 'package:flutter/material.dart';
import 'package:flutter_dsa/problem_detail_screen.dart';
import 'package:flutter_dsa/problem_router.dart';

class ProblemListScreen extends StatelessWidget {
  final String sectionName;
  final List<String> problems;

  const ProblemListScreen({
    super.key,
    required this.sectionName,
    required this.problems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sectionName)),
      body: ListView.builder(
        itemCount: problems.length,
        itemBuilder: (context, index) {
          final problemName = problems[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(problemName),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
              onTap: () {
                // ✅ check if the problem has a screen in the map
                if (problemRoutes.containsKey(problemName)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: problemRoutes[problemName]!,
                    ),
                  );
                } else {
                  // 🚧 If not yet created, open a placeholder screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProblemDetailScreen(
                        problemName: problemName,
                      ),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
