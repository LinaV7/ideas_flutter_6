import 'package:flutter/material.dart';
import 'ideas_detail.dart';
import 'great_ideas.dart';

void main() {
  runApp(const NavApp());
}

class NavApp extends StatelessWidget {
  const NavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const GreatIdeas(),
        '/ideas-detail': (context) => const IdeasDetail(),
      },
    );
  }
}
