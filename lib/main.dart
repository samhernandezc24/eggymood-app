import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EggyMood',
      home: Scaffold(
          body: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Starting EggyMood App',
            textAlign: TextAlign.center,
          ),
        ],
      ))),
    );
  }
}
