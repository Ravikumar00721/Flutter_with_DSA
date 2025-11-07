import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contains_Duplicate extends StatefulWidget {
  const Contains_Duplicate({super.key});

  @override
  State<Contains_Duplicate> createState() => _Contains_DuplicateState();
}

class _Contains_DuplicateState extends State<Contains_Duplicate> {

  List<String> names = ["Alice", "Bob", "Charlie", "David", "Alice"];
  String result = "";

  bool hasDuplicateNames() {
    Map<String, bool> seen = {};

    for (var name in names) {
      if (seen.containsKey(name)) {
        return true;
      }
      seen[name] = true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authenticate Unique Names"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text("Name: ${names[index]}"),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                bool hasDuplicate = hasDuplicateNames();
                setState(() {
                  result = hasDuplicate
                      ? "Duplicate name found!"
                      : "All names are unique ";
                });
              },
              child: const Text("Authenticate Names"),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
