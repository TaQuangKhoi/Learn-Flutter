import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final AudioCache audioCache = AudioCache();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

