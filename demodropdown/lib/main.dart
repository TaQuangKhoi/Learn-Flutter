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
      title: 'Flutter Demo',
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
          title: const Text('Flutter Demo Home Page'),
          backgroundColor: Colors.teal[300],
        ),
        body: const DemoDropdownButton(),
      ),
    );
  }
}

class DemoDropdownButton extends StatefulWidget {
  const DemoDropdownButton({super.key});

  @override
  State<DemoDropdownButton> createState() => _DemoDropdownButtonState();
}

class _DemoDropdownButtonState extends State<DemoDropdownButton> {
  var items = ['One', 'Two', 'Three', 'Four', 'Five'];

  String _selectedOption = 'One';
  String _selectedOptionSubmit = 'One';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
          value: _selectedOption,
          items: items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          style: const TextStyle(
            fontSize: 30,
            color: Colors.teal,
          ),
        ),
        Text(
          'Selected option: $_selectedOption',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.teal,
          ),
        )
      ],
    ));
  }
}
