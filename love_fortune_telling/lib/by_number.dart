import 'package:flutter/material.dart';

class ByNumber extends StatefulWidget {
  const ByNumber({super.key});

  @override
  State<ByNumber> createState() => _ByNumberState();
}

class _ByNumberState extends State<ByNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('By Number'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Placeholder()
    );
  }
}
