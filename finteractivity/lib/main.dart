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
      title: 'Flutter Interactivity',
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
          title: const Text('Flutter Interactivity'),
          backgroundColor: Colors.teal[300],
        ),
        body: null,
      )
    );
  }
}

class DemoElevatedButton extends StatefulWidget {
  const DemoElevatedButton({super.key});

  @override
  State<DemoElevatedButton> createState() => _DemoElevatedButtonState();
}

class _DemoElevatedButtonState extends State<DemoElevatedButton> {
  String _text = 'Change me';

  void update() {
    setState(() {
      _text = 'Button Tapped';
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 30),
      backgroundColor: Colors.teal[500],
    );

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_text, style: TextStyle(fontSize: 50),),
          ElevatedButton(
            onPressed: null,
            child: const Text('Disabled'),
            style: _buttonStyle,
          ),
          ElevatedButton(
            onPressed: update,
            child: const Text('Enabled'),
            style: _buttonStyle,
          ),
        ],
      )
    );
  }
}

class DemoTextButton extends StatefulWidget {
  const DemoTextButton({super.key});

  @override
  State<DemoTextButton> createState() => _DemoTextButtonState();
}

class _DemoTextButtonState extends State<DemoTextButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
            ),
            onPressed: null,
            child: const Text('Disabled'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 30),
            ),
            onPressed: () {},
            child: const Text('Enabled'),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 30),
                backgroundColor: Colors.teal[500],
              ),
              onPressed: () {},
              child: const Text('ClipRRect'),
            ),
          ),
        ],
      )
    );
  }
}

