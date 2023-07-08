import 'package:flutter/material.dart';

class ByPercent extends StatefulWidget {
  const ByPercent({super.key});

  @override
  State<ByPercent> createState() => _ByPercentState();
}

class _ByPercentState extends State<ByPercent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('By Percent'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Placeholder());
  }
}
