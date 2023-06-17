import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = '';
  int luckyNumber = 0;
  Set luckyNumbers = {};

  @override
  void initState() {
    // TODO: implement initState
    text = 'initState: Hello World';
    super.initState();
  }

  void btnTap() {
    setState(() {
      text = 'setState: Hi Everyone';
      luckyNumber = Random().nextInt(10);

      // Loop 6 times
      for (var i = 0; i < 6; i++) {
        if (luckyNumbers.length == 6) {
          break;
        }
        luckyNumbers.add(Random().nextInt(55));
      }
    });
  }

  void generateTextForLuckyNumbers() {
    // return luckyNumbers.map((e) => Text(e.toString())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello App'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            Image(image: AssetImage('assets/images/dice1.png')),
            ElevatedButton(onPressed: btnTap, child: const Text('Tap Me'))
          ],
        )),
      ),
    );
  }
}
