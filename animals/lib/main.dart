import 'dart:developer';

import 'package:animals/Question.dart';
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
      title: 'Flutter Animals',
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
      home: const MyHomePage(title: 'Flutter Animals'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var questions = [
    Question(
        q: 'What is the name of this animal?',
        i: 'https://cdn-icons-png.flaticon.com/512/2194/2194807.png',
        a: 'Cat',
        b: 'Dog',
        c: 'Pig',
        d: 'Cow',
        r: 3),
    Question(
        q: 'What is the name of this animal?',
        i: 'https://cdn-icons-png.flaticon.com/512/1998/1998592.png',
        a: 'Cat',
        b: 'Dog',
        c: 'Pig',
        d: 'Cow',
        r: 1),
    Question(
        q: 'What is the name of this animal?',
        i: 'https://cdn-icons-png.flaticon.com/512/1998/1998627.png',
        a: 'Cat',
        b: 'Dog',
        c: 'Pig',
        d: 'Cow',
        r: 2),
    Question(
        q: 'What is the name of this animal?',
        i: 'https://cdn-icons-png.flaticon.com/512/2395/2395796.png',
        a: 'Cat',
        b: 'Dog',
        c: 'Pig',
        d: 'Cow',
        r: 4),
  ];

  int index = 1;
  int score = 0;

  @override
  void initState() {
    // TODO: implement initState
    score = 0;
    super.initState();
  }

  void updateUI(int buttonNumber) {
    setState(() {
      if(checkAnswer(buttonNumber)) {
        score = score + 5;
      }
      if (index < questions.length - 1) {
        index = index + 1;
      } else {
        index = 0;
      }
    });
  }

  bool checkAnswer(int answer) {
    log("Answer: $answer Right Answer: ${questions[index].rightAnswer}");
    if (answer == questions[index].rightAnswer) {
      log('Right!');
      return true;
    } else {
      log('Wrong!');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.white, fontSize: 20);
    const button1Color = Color(0xFFff9800);
    const button2Color = Color(0xFF4caf50);
    const button3Color = Color(0xFF2196F3);
    const button4Color = Color(0xFFe91e63);
    const borderRadius = BorderRadius.all(Radius.circular(5.0));
    
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Timer: 10'),
              Text('Score: $score'),
              Container(
                constraints: const BoxConstraints.expand(height: 200),
                child: Image.network(
                    questions[index].imageUrl),
              ),
              Container( // Button 1
                margin: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minHeight: 70),
                child: Ink(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {updateUI(1);},
                      child: Text(questions[index].answer1, style: textStyle),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              button1Color),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: borderRadius,
                                      side: BorderSide(color: button1Color))))),
                ),
              ),
              Container( // Button 2
                margin: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minHeight: 70),
                child: Ink(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {updateUI(2);},
                      child: Text(questions[index].answer2, style: textStyle),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              button2Color),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: borderRadius,
                                      side: BorderSide(color: button2Color))))),
                ),
              ),
              Container( // Button 3
                margin: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minHeight: 70),
                child: Ink(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {updateUI(3);},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              button3Color),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: borderRadius,
                                      side: BorderSide(color: button3Color)))),
                      child: Text(questions[index].answer3, style: textStyle)),
                ),
              ),
              Container( // Button 4
                margin: const EdgeInsets.all(10),
                constraints: const BoxConstraints(minHeight: 70),
                child: Ink(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {updateUI(4);},
                      child: Text(questions[index].answer4, style: textStyle),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              button4Color),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: borderRadius,
                                      side: BorderSide(color: button4Color))))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
