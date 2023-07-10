import 'package:flutter/material.dart';

class EnterNamePage extends StatefulWidget {
  final int mode;

  const EnterNamePage({super.key, required this.mode});

  @override
  State<EnterNamePage> createState() => _EnterNamePageState();
}

class _EnterNamePageState extends State<EnterNamePage> {
  late TextEditingController _maleTextController;
  late TextEditingController _femaleTextController;
  String _nameOfMale = '';
  String _nameOfFemale = '';

  double padding = 20.0;

  @override
  void initState() {
    _maleTextController = TextEditingController();
    _femaleTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _maleTextController.dispose();
    _femaleTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.mode == 1 ? 'By Number' : 'By Percent'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.mode == 1 ? "Enter your name and your partner's name" : "Enter your fullname and your partner's fullname",
                  style: const TextStyle(fontSize: 30)),
              Container(
                margin: const EdgeInsets.all(10),
                padding: EdgeInsets.all(padding),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Name of Male',
                            style: TextStyle(fontSize: 30)),
                        Icon(Icons.male, color: Colors.pink, size: 30),
                      ],
                    ),
                    TextField(
                      controller: _maleTextController,
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
                padding: EdgeInsets.all(padding),
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Name of Female',
                          style: TextStyle(fontSize: 30),
                        ),
                        Icon(Icons.female, color: Colors.pink, size: 30),
                      ],
                    ),
                    TextField(
                      controller: _femaleTextController,
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
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  Route
                  arguments: {
                    'nameOfMale': _nameOfMale,
                    'nameOfFemale': _nameOfFemale,
                  },
                )
              }, child: const Text('Submit'))
            ],
          ),
        ));
  }
}
