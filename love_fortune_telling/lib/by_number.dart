import 'package:flutter/material.dart';

class ByNumber extends StatefulWidget {
  const ByNumber({super.key});

  @override
  State<ByNumber> createState() => _ByNumberState();
}

class _ByNumberState extends State<ByNumber> {
  late TextEditingController _textController;
  String _nameOfMale = '';
  String _nameOfFemale = '';

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('By Number'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.pink,
                    width: 3,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Name of Male',
                            style: TextStyle(fontSize: 30)),
                        Icon(Icons.male, color: Colors.pink, size: 30),
                      ],
                    ),
                    TextField(
                      controller: _textController,
                      style: const TextStyle(fontSize: 30),
                      onChanged: (text) {
                        setState(() {
                          _nameOfMale = text;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.pink,
                    width: 3,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Name of Female',
                      style: TextStyle(fontSize: 30),
                    ),
                    TextField(
                      controller: _textController,
                      style: const TextStyle(fontSize: 30),
                      onChanged: (text) {
                        setState(() {
                          _nameOfFemale = text;
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
