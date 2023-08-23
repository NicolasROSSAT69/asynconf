import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Asynconf 2023"),
        ),
        body: const Center(
            child: Text(
                "Bienvenue sur l'application du salon",
              style: TextStyle(
                fontSize: 24,
              ),
            )
        )
      ),
    );
  }
}
