import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Form'),
          backgroundColor: Colors.teal[300],
        ),
        body: DemoTextField(),
      ),
    );
  }
}

class DemoTextField extends StatefulWidget {
  const DemoTextField({super.key});

  @override
  State<DemoTextField> createState() => _DemoTextFieldState();
}

class _DemoTextFieldState extends State<DemoTextField> {
  late TextEditingController _textController;
  String _text = 'Hello';
  String _textSubmit = 'Hi';

  @override
  void initState() {
    // TODO: implement initState
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _textController,
            style: const TextStyle(fontSize: 30),
            onChanged: (text) {
              setState(() {
                _text = text;
              });
            },
          ),
          Text(
            _text,
            style: const TextStyle(fontSize: 30),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Submit Text', style: TextStyle(fontSize: 30),)),
          Text(
            'Hi $_textSubmit',
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}
