import 'package:flutter/material.dart';

import 'screens/initial_screen/initial_screen.dart';

void main() => runApp(const QuizzlerApp());

class QuizzlerApp extends StatelessWidget {
  const QuizzlerApp({Key? key}) : super(key: key);

  final bool clickedTheButton = false;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialScreen(),
    );
  }
}
