import 'package:flutter/material.dart';
import 'package:love_fortune_telling/enter_name_page.dart';

import 'home_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/by_number': (context) => const EnterNamePage(mode: 1,),
        '/by_percent': (context) => const EnterNamePage(mode: 2,),
      },
    );
  }
}
