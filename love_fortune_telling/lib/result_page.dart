import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final String nameOfMale;
  final String nameOfFemale;

  const ResultPage({super.key,
    required this.nameOfMale,
    required this.nameOfFemale,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('By Percent'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.nameOfMale,
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
              Text(
                widget.nameOfFemale,
                style: const TextStyle(fontSize: 30, color: Colors.black),
              ),
            ],
          ),
        ));
  }
}
