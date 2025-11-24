import 'package:flutter/material.dart';

class MergeEventsUI extends StatefulWidget {
  const MergeEventsUI({super.key});

  @override
  State<MergeEventsUI> createState() => _MergeEventsUIState();
}

class _MergeEventsUIState extends State<MergeEventsUI> {
  List<List<int>> events = [
    [1, 3],
    [2, 6],
    [8, 10],
    [15, 18],
  ];

  List<List<int>> merged = [];

  void mergeEventTimes() {
    events.sort((a, b) => a[0].compareTo(b[0]));
    merged = [];
    merged.add(events[0]);

    for (int i = 1; i < events.length; i++) {
      if (merged.last[1] >= events[i][0]) {
        merged.last[1] = events[i][1] > merged.last[1]
            ? events[i][1]
            : merged.last[1];
      } else {
        merged.add(events[i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Event Scheduler")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Original Events (Start - End):",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: events
                  .map((e) => Chip(label: Text("${e[0]} - ${e[1]}")))
                  .toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: mergeEventTimes,
              child: const Text("Merge Overlapping Events"),
            ),
            const SizedBox(height: 20),
            const Text(
              "Merged Events:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            merged.isEmpty
                ? const Text("No merged events yet")
                : Wrap(
              spacing: 10,
              children: merged
                  .map((m) => Chip(label: Text("${m[0]} - ${m[1]}")))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
