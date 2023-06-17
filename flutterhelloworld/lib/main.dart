import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Hello World App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Hello World App"),
        ),
        body: const Center(
          child: Text("Hello World"),
        ),
      ),
    )
  );
}


