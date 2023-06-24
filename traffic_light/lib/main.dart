import 'dart:async';
import 'dart:developer';

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
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Traffic Light"),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Light(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}

class Light extends StatefulWidget {
  const Light({super.key});

  @override
  State<Light> createState() => _LightState();
}

class _LightState extends State<Light> {
  String light = "green";
  String instruction = "GO";
  Color? instructionColor = Colors.green[500];

  int _count = 10;
  Timer? timer;

  String buttonText = "START";

  @override
  void initState() {
    // TODO: implement initState
    _count = 10;
    light = "green";
    instruction = "GO";
    instructionColor = Colors.green[500];

    buttonText = "START";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          instruction,
          style: TextStyle(fontSize: 30, color: instructionColor),
        ),
        Text(
          _count.toString(),
          style: TextStyle(fontSize: 30, color: instructionColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.circle,
              color: Colors.green[turnOnLight("green")],
              size: 100,
            ),
            Icon(
              Icons.circle,
              color: Colors.yellow[turnOnLight("yellow")],
              size: 100,
            ),
            Icon(
              Icons.circle,
              color: Colors.red[turnOnLight("red")],
              size: 100,
            ),
          ],
        ),
        ElevatedButton(onPressed: tapButton, child: Text(buttonText)),
        ElevatedButton(onPressed: changeLight, child: Text("CHANGE LIGHT"))
      ],
    );
  }

  void _startTimer([int? seconds]) {
    setState(() {
      if (seconds != null) {
        _count = seconds;
      } else if (light == "green") {
        _count = 30;
      } else if (light == "yellow") {
        _count = 3;
      } else {
        _count = 15;
      }
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_count > 0) {
          _count--;
        } else {
          changeLight();
          timer.cancel();
        }
      });
    });
  }

  void changeLight() {
    setState(() {
      if (light == "green") {
        light = "yellow";
        instruction = "SLOW DOWN";
        instructionColor = Colors.yellow[500];
        log("yellow");
      } else if (light == "yellow") {
        light = "red";
        instruction = "STOP";
        instructionColor = Colors.red[500];
        log("red");
      } else {
        light = "green";
        instruction = "GO";
        instructionColor = Colors.green[500];
        log("green");
      }
    });
    _startTimer();
  }

  void tapButton() {
    if (buttonText == "START") {
      startLightWork();
      log("start");
    } else {
      stopLightWork();
      log("stop");
    }
  }

  void startLightWork() {
    setButtonText("STOP");
    _startTimer();
  }

  void stopLightWork() {
    setButtonText("START");
  }

  void redLightWork() {
    setState(() {
      light = "red";
      instruction = "STOP";
      instructionColor = Colors.red[500];
    });
  }

  void yellowLightWork() {
    setState(() {
      light = "yellow";
      instruction = "SLOW DOWN";
      instructionColor = Colors.yellow[500];
    });
  }

  void greenLightWork() {
    setState(() {
      light = "green";
      instruction = "GO";
      instructionColor = Colors.green[500];
    });
  }

  void setButtonText(String text) {
    setState(() {
      buttonText = text;
    });
  }

  int turnOnLight(String lightActive) {
    int num = 100;
    if (light == lightActive) {
      num = 500;
    }
    return num;
  }
}
