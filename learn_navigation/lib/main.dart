import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
     title: 'Route',
      home: FirstScreen(),
    )
  );
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
          child: const Text('Second Screen', style: TextStyle(fontSize: 30, color: Colors.black),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange[300],
          ),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const SecondScreen()),
            // );
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        backgroundColor: Colors.orange[300],
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('First Screen', style: TextStyle(fontSize: 30, color: Colors.black),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
          ),
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

