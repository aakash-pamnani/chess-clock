import 'package:flutter/material.dart';

import 'HomeScreen/UI/timers_screen.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Timers(),
    );
  }
}


