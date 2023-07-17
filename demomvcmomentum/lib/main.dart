import '../views/gameview.dart';
import 'package:flutter/material.dart';
import 'package:momentum/momentum.dart';

import 'controllers/gamecontronller.dart';

void main() {
  runApp(Momentum(controllers: [GameController()], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Momentum'),
        ),
        body: const GameView(),
      ),
    );
  }
}
