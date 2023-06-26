import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final AudioCache audioCache = AudioCache();
  final AudioPlayer audioPlayer = AudioPlayer();
  double maxWidth = 700;

  void btnTapped(noteName) {
    Source audioSource = DeviceFileSource('assets/audios/note$noteName.wav');
    audioPlayer.play(audioSource);
    log("Button Tapped");
  }

  double calWidth(screenSize, percent) {
    return maxWidth = screenSize.width * percent;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Xylophone",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Xylophone"),
          backgroundColor: Colors.teal[300],
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(child: ConstrainedBox(
                constraints: BoxConstraints.expand(),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ElevatedButton(
                    onPressed: () => btnTapped("DO"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(800, 400),
                      backgroundColor: Colors.red,
                    ),
                    child: Text("DO"),
                  ),
                ),
              )),
              Expanded(child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: calWidth(MediaQuery.of(context).size, 0.9)),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ElevatedButton(
                    onPressed: () => btnTapped("RE"),
                    style: TextButton.styleFrom(
                      minimumSize: const Size(800, 400),
                      backgroundColor: Colors.yellow,
                    ),
                    child: Text("RE"),
                  ),
                ),
              )),
              Expanded(child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: calWidth(MediaQuery.of(context).size, 0.8)),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ElevatedButton(
                    onPressed: () => btnTapped("MI"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(800, 400),
                      backgroundColor: Colors.green,
                    ),
                    child: Text("MI"),
                  ),
                ),
              )),
              Expanded(child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: calWidth(MediaQuery.of(context).size, 0.7)),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ElevatedButton(
                    onPressed: () => btnTapped("FA"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(800, 400),
                      backgroundColor: Colors.pink,
                    ),
                    child: Text("FA"),
                  ),
                ),
              )),
              Expanded(child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: calWidth(MediaQuery.of(context).size, 0.6)),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ElevatedButton(
                    onPressed: () => btnTapped("SOL"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(800, 400),
                      backgroundColor: Colors.purple,
                    ),
                    child: Text("SOL"),
                  ),
                ),
              )),
              Expanded(child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: calWidth(MediaQuery.of(context).size, 0.5)),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ElevatedButton(
                    onPressed: () => btnTapped("LA"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(800, 400),
                      backgroundColor: Colors.orange,
                    ),
                    child: Text("LA"),
                  ),
                ),
              )),
              Expanded(child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: calWidth(MediaQuery.of(context).size, 0.4)),
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: ElevatedButton(
                    onPressed: () => btnTapped("SI"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(800, 400),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text("SI"),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

