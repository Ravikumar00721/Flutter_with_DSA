import 'package:flutter/material.dart';

class CleanMessagesApp extends StatefulWidget {
  const CleanMessagesApp({super.key});

  @override
  State<CleanMessagesApp> createState() => _CleanMessagesAppState();
}

class _CleanMessagesAppState extends State<CleanMessagesApp> {

  List<String> messages = [
    "Hello!",
    "Hi!",
    "Hello!",
    "How are you?",
    "Hi!",
    "Welcome!"
  ];

  List<String> cleaned = [];

  List<String> cleanedList(List<String> messages)
  {
    return messages.toSet().toList();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remove Duplicate"),
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(child: ListView(
            children: messages.map((m)=>ListTile(title: Text(m),)).toList(),
          )),
          ElevatedButton(
            onPressed: () {
              setState(() {
                cleaned = cleanedList(messages);
              });
            },
            child: const Text("Clean Duplicates"),
          ),
          const SizedBox(height: 20),

          if(cleaned.isNotEmpty)
            Expanded(child: ListView(
              children: cleaned.map((m)=>ListTile(title: Text(m),)).toList(),
            ))
        ],
      ),
      ),
    );
  }
}