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
    onGenerateRoute: (settings) {
      if (settings.name == '/third') {
        final todo = settings.arguments as ToDo;
        return MaterialPageRoute(
          builder: (context) => ThirdScreen(todo: todo),
        );
      }
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[300],
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/second',
                    arguments: const ToDo(
                      title: 'Todo title',
                      description: 'Todo description - extract',
                    ));
              },
              child: const Text(
                'Second Screen',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/third',
                    arguments: const ToDo(
                      title: 'Todo title',
                      description: 'Todo description - pass',
                    ));
              },
              child: const Text(
                'Third Screen',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            )
          ],
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

class ThirdScreen extends StatelessWidget {
  final ToDo todo;

  const ThirdScreen({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        backgroundColor: Colors.purple[300],
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
        ),
      ),
    );
  }
}
