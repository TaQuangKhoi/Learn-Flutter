import 'package:flutter/material.dart';

import 'ToDo.dart';

void main() {
  runApp(MaterialApp(
    title: 'Route',
    home: const FirstScreen(),
    routes: {
      '/first': (context) => const FirstScreen(),
      '/second': (context) => const SecondScreen(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        backgroundColor: Colors.teal[300],
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[300],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/second',
                arguments: const ToDo(
                  title: 'First Screen',
                  description: 'This is the first screen',
                ));
          },
          child: const Text(
            'Second Screen',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as ToDo;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.orange[300],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            todo.title,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
          Text(
            todo.description,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          ),
          ElevatedButton(
            child: const Text(
              'First Screen',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      )),
    );
  }
}
