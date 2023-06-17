import 'package:flutter/material.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    text = 'initState: Hello World';
    super.initState();
  }

  void btnTap() {
    setState(() {
      text = 'setState: Hi Everyone';
    });
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
            ElevatedButton(onPressed: btnTap, child: const Text('Tap Me'))
          ],
        )),
      ),
    );
  }
}
